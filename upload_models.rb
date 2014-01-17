#!/usr/bin/env ruby

require 'rest_client'

USERNAME = "username"
PASSWORD = "password"
# Are we uploading SPL models? The directory structure will be different
IS_SPL = false

# Helper script to package and upload our models to the dashboard
# This script makes many assumptions and does almost no error checking

# Assume we're in a models directory with a bunch of *.als files

currdir = Dir.getwd
dirname = File.basename(currdir)

Dir.glob('*.als').each do |model|
  filename = File.basename(model, ".als")

  # Create the model on the dashboard
  # We assume a certain directory structure
  # Grab the model ID
  if IS_SPL
    Dir.chdir "#{currdir}/../../../dashboard"
    output = `heroku run rake model:create NAME=spl/#{dirname}/#{model}`
  else
    Dir.chdir "#{currdir}/../../dashboard"
    output = `heroku run rake model:create NAME=#{dirname}/#{model}`
  end

  last_line = output.lines.last
  model_id = last_line.split(/ /).last
  puts "Created model #{model} on dashboard with id #{model_id}"

  Dir.chdir "#{currdir}"

  # Copy the model to model.als
  FileUtils.copy("#{filename}.als", "model.als")
  # Create a bzipped tarball containing just that model
  `tar cjvf #{filename}.tar.bz2 model.als`
  FileUtils.rm("model.als")

  # Sometimes we try to upload and get a 404... is this a race condition?
  sleep(2)

  # Make a post request to dashboard to upload it
  RestClient.post(URI.encode("http://#{USERNAME}:#{PASSWORD}@amalgam.herokuapp.com/models/#{model_id}/upload"),
                  :file => File.new("#{currdir}/#{filename}.tar.bz2")
                 )

  # Delete archive file
  FileUtils.rm("#{filename}.tar.bz2")
end
