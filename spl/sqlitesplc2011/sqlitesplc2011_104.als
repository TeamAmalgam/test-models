open util/integer

abstract sig IMeasurable { footprint : one Int }

one sig OperatingSystemCharacteristics extends IMeasurable {}
{
  footprint = 888
}

one sig SQLITE_4_BYTE_ALIGNED_MALLOC extends IMeasurable {}
{
  footprint = 0
}

one sig SQLITE_CASE_SENSITIVE_LIKE extends IMeasurable {}
{
  footprint = 0
}

one sig SQLITE_HAVE_ISNAN extends IMeasurable {}
{
  footprint = 0
}

one sig SQLITE_SECURE_DELETE extends IMeasurable {}
{
  footprint = 0
}

one sig ChooseSQLITE_TEMP_STORE extends IMeasurable {}
{
  footprint = 0
}

one sig SQLITE_TEMP_STORE_EQ_0 extends IMeasurable {}
{
  footprint = 0
}

one sig SQLITE_TEMP_STORE_EQ_1 extends IMeasurable {}
{
  footprint = 0
}

one sig SQLITE_TEMP_STORE_EQ_2 extends IMeasurable {}
{
  footprint = 0
}

one sig SQLITE_TEMP_STORE_EQ_3 extends IMeasurable {}
{
  footprint = 0
}

one sig EnableFeatures extends IMeasurable {}
{
  footprint = 0
}

one sig SQLITE_ENABLE_ATOMIC_WRITE extends IMeasurable {}
{
  footprint = 3
}

one sig SQLITE_ENABLE_COLUMN_METADATA extends IMeasurable {}
{
  footprint = 2
}

one sig SQLITE_ENABLE_FTS3 extends IMeasurable {}
{
  footprint = 100
}

one sig SQLITE_ENABLE_FTS3_PARENTHESIS extends IMeasurable {}
{
  footprint = 0
}

one sig SQLITE_ENABLE_MEMORY_MANAGEMENT extends IMeasurable {}
{
  footprint = 1
}

one sig ChooseMemSys extends IMeasurable {}
{
  footprint = 3
}

one sig SQLITE_ENABLE_MEMSYS3 extends IMeasurable {}
{
  footprint = 2
}

one sig SQLITE_ENABLE_MEMSYS5 extends IMeasurable {}
{
  footprint = 0
}

one sig SQLITE_ENABLE_RTREE extends IMeasurable {}
{
  footprint = 33
}

one sig SQLITE_ENABLE_STAT2 extends IMeasurable {}
{
  footprint = 4
}

one sig SQLITE_ENABLE_UPDATE_DELETE_LIMIT extends IMeasurable {}
{
  footprint = 1
}

one sig SQLITE_ENABLE_UNLOCK_NOTIFY extends IMeasurable {}
{
  footprint = 3
}

one sig SQLITE_SOUNDEX extends IMeasurable {}
{
  footprint = 1
}

one sig YYTRACKMAXSTACKDEPTH extends IMeasurable {}
{
  footprint = 0
}

one sig DisableFeatures extends IMeasurable {}
{
  footprint = 0
}

one sig SQLITE_DISABLE_LFS extends IMeasurable {}
{
  footprint = 0
}

one sig SQLITE_DISABLE_DIRSYNC extends IMeasurable {}
{
  footprint = 0
}

one sig OmitFeatures extends IMeasurable {}
{
  footprint = 0
}

one sig SQLITE_OMIT_ALTERTABLE extends IMeasurable {}
{
  footprint = -7
}

one sig SQLITE_OMIT_ANALYZE extends IMeasurable {}
{
  footprint = -5
}

one sig SQLITE_OMIT_ATTACH extends IMeasurable {}
{
  footprint = -8
}

one sig SQLITE_OMIT_AUTHORIZATION extends IMeasurable {}
{
  footprint = -5
}

one sig SQLITE_OMIT_AUTOINCREMENT extends IMeasurable {}
{
  footprint = -3
}

one sig SQLITE_OMIT_AUTOMATIC_INDEX extends IMeasurable {}
{
  footprint = -4
}

one sig SQLITE_OMIT_AUTOINIT extends IMeasurable {}
{
  footprint = 0
}

one sig SQLITE_OMIT_AUTOVACUUM extends IMeasurable {}
{
  footprint = -14
}

one sig SQLITE_OMIT_BETWEEN_OPTIMIZATION extends IMeasurable {}
{
  footprint = 0
}

one sig SQLITE_OMIT_BLOB_LITERAL extends IMeasurable {}
{
  footprint = -1
}

one sig SQLITE_OMIT_BTREECOUNT extends IMeasurable {}
{
  footprint = -2
}

one sig SQLITE_OMIT_BUILTIN_TEST extends IMeasurable {}
{
  footprint = -2
}

one sig SQLITE_OMIT_CAST extends IMeasurable {}
{
  footprint = -1
}

one sig SQLITE_OMIT_CHECK extends IMeasurable {}
{
  footprint = -1
}

one sig SQLITE_OMIT_COMPILEOPTION_DIAGS extends IMeasurable {}
{
  footprint = -1
}

one sig SQLITE_OMIT_COMPLETE extends IMeasurable {}
{
  footprint = -888
}

one sig SQLITE_OMIT_COMPOUND_SELECT extends IMeasurable {}
{
  footprint = -10
}

one sig SQLITE_OMIT_CONFLICT_CLAUSE extends IMeasurable {}
{
  footprint = 0
}

one sig SQLITE_OMIT_DATETIME_FUNCS extends IMeasurable {}
{
  footprint = -10
}

one sig SQLITE_OMIT_DECLTYPE extends IMeasurable {}
{
  footprint = -1
}

one sig SQLITE_OMIT_DEPRECATED extends IMeasurable {}
{
  footprint = -1
}

one sig SQLITE_OMIT_EXPLAIN extends IMeasurable {}
{
  footprint = -10
}

one sig SQLITE_OMIT_FLAG_PRAGMAS extends IMeasurable {}
{
  footprint = -1
}

one sig SQLITE_OMIT_FLOATING_POINT extends IMeasurable {}
{
  footprint = -18
}

one sig SQLITE_OMIT_FOREIGN_KEY extends IMeasurable {}
{
  footprint = -15
}

one sig SQLITE_OMIT_GET_TABLE extends IMeasurable {}
{
  footprint = -3
}

one sig SQLITE_OMIT_INCRBLOB extends IMeasurable {}
{
  footprint = -7
}

one sig SQLITE_OMIT_INTEGRITY_CHECK extends IMeasurable {}
{
  footprint = -9
}

one sig SQLITE_OMIT_LIKE_OPTIMIZATION extends IMeasurable {}
{
  footprint = -2
}

one sig SQLITE_OMIT_LOAD_EXTENSION extends IMeasurable {}
{
  footprint = -3
}

one sig SQLITE_OMIT_LOCALTIME extends IMeasurable {}
{
  footprint = -1
}

one sig SQLITE_OMIT_LOOKASIDE extends IMeasurable {}
{
  footprint = -1
}

one sig SQLITE_OMIT_MEMORYDB extends IMeasurable {}
{
  footprint = -2
}

one sig SQLITE_OMIT_OR_OPTIMIZATION extends IMeasurable {}
{
  footprint = -5
}

one sig SQLITE_OMIT_PAGER_PRAGMAS extends IMeasurable {}
{
  footprint = -5
}

one sig SQLITE_OMIT_PRAGMA extends IMeasurable {}
{
  footprint = -16
}

one sig SQLITE_OMIT_PROGRESS_CALLBACK extends IMeasurable {}
{
  footprint = -1
}

one sig SQLITE_OMIT_QUICKBALANCE extends IMeasurable {}
{
  footprint = -1
}

one sig SQLITE_OMIT_REINDEX extends IMeasurable {}
{
  footprint = -1
}

one sig SQLITE_OMIT_SCHEMA_PRAGMAS extends IMeasurable {}
{
  footprint = -2
}

one sig SQLITE_OMIT_SCHEMA_VERSION_PRAGMAS extends IMeasurable {}
{
  footprint = -1
}

one sig SQLITE_OMIT_SHARED_CACHE extends IMeasurable {}
{
  footprint = -10
}

one sig SQLITE_OMIT_SUBQUERY extends IMeasurable {}
{
  footprint = -11
}

one sig SQLITE_OMIT_TCL_VARIABLE extends IMeasurable {}
{
  footprint = 0
}

one sig SQLITE_OMIT_TEMPDB extends IMeasurable {}
{
  footprint = 0
}

one sig SQLITE_OMIT_TRACE extends IMeasurable {}
{
  footprint = -3
}

one sig SQLITE_OMIT_TRIGGER extends IMeasurable {}
{
  footprint = -27
}

one sig SQLITE_OMIT_TRUNCATE_OPTIMIZATION extends IMeasurable {}
{
  footprint = 0
}

one sig SQLITE_OMIT_UTF16 extends IMeasurable {}
{
  footprint = -8
}

one sig SQLITE_OMIT_VACUUM extends IMeasurable {}
{
  footprint = -4
}

one sig SQLITE_OMIT_VIEW extends IMeasurable {}
{
  footprint = -3
}

one sig SQLITE_OMIT_VIRTUALTABLE extends IMeasurable {}
{
  footprint = -20
}

one sig SQLITE_OMIT_WAL extends IMeasurable {}
{
  footprint = -30
}

one sig SQLITE_OMIT_XFER_OPT extends IMeasurable {}
{
  footprint = -3
}

one sig SQLITE_DEBUG extends IMeasurable {}
{
  footprint = 9
}

one sig SQLITE_MEMDEBUG extends IMeasurable {}
{
  footprint = 2
}

one sig Sqlite
{
  features : set IMeasurable,
  totalFootprint : one Int
}

fact { all s : Sqlite | s.totalFootprint = (sum f : s.features | f.footprint ) }

pred featureSet
{
  // OperatingSystemCharacteristics is Mandatory
  OperatingSystemCharacteristics in Sqlite.features
  
  // SQLITE_4_BYTE_ALIGNED_MALLOC is Mandatory
  SQLITE_4_BYTE_ALIGNED_MALLOC in Sqlite.features

  // If we have a temp store then we need to choose exactly one store
  // If we have a store we need to have a temp store
  // We can choose at most one store
  (ChooseSQLITE_TEMP_STORE in Sqlite.features) <=> (one ((SQLITE_TEMP_STORE_EQ_0 + SQLITE_TEMP_STORE_EQ_1 + SQLITE_TEMP_STORE_EQ_2 + SQLITE_TEMP_STORE_EQ_3) & Sqlite.features))
  lone ((SQLITE_TEMP_STORE_EQ_0 + SQLITE_TEMP_STORE_EQ_1 + SQLITE_TEMP_STORE_EQ_2 + SQLITE_TEMP_STORE_EQ_3) & Sqlite.features)

  // EnableFeatures is Mandatory
  EnableFeatures in Sqlite.features

  // SQLITE_ENABLE_COLUMN_METADATA and SQLITE_OMIT_DECLTYPE are mutually exclusive
  lone ((SQLITE_ENABLE_COLUMN_METADATA + SQLITE_OMIT_DECLTYPE) & Sqlite.features)

  // If we choose a memsys then we must choose one of them  
  (ChooseMemSys in Sqlite.features) <=> (one ((SQLITE_ENABLE_MEMSYS3 + SQLITE_ENABLE_MEMSYS5) & Sqlite.features))
  lone ((SQLITE_ENABLE_MEMSYS3 + SQLITE_ENABLE_MEMSYS5) & Sqlite.features)

  // DisableFeatures is Mandatory
  DisableFeatures in Sqlite.features

  // OmitFeatures is Mandatory
  OmitFeatures in Sqlite.features

  // Define the partial configuration here:
	OperatingSystemCharacteristics in Sqlite.features
  SQLITE_SECURE_DELETE not in Sqlite.features
  ChooseSQLITE_TEMP_STORE in Sqlite.features
  SQLITE_TEMP_STORE_EQ_0 in Sqlite.features
  SQLITE_TEMP_STORE_EQ_1 not in Sqlite.features
  SQLITE_TEMP_STORE_EQ_2 not in Sqlite.features
  SQLITE_ENABLE_ATOMIC_WRITE not in Sqlite.features
  SQLITE_ENABLE_COLUMN_METADATA in Sqlite.features
  SQLITE_ENABLE_FTS3 not in Sqlite.features
  SQLITE_ENABLE_RTREE not in Sqlite.features
  SQLITE_ENABLE_UPDATE_DELETE_LIMIT not in Sqlite.features
  SQLITE_ENABLE_UNLOCK_NOTIFY not in Sqlite.features
  SQLITE_SOUNDEX in Sqlite.features
  YYTRACKMAXSTACKDEPTH in Sqlite.features
  SQLITE_DISABLE_LFS in Sqlite.features
  SQLITE_DISABLE_DIRSYNC in Sqlite.features
  SQLITE_OMIT_ALTERTABLE not in Sqlite.features
  SQLITE_OMIT_ANALYZE in Sqlite.features
  SQLITE_OMIT_AUTHORIZATION in Sqlite.features
  SQLITE_OMIT_AUTOINCREMENT not in Sqlite.features
  SQLITE_OMIT_AUTOMATIC_INDEX in Sqlite.features
  SQLITE_OMIT_AUTOINIT not in Sqlite.features
  SQLITE_OMIT_AUTOVACUUM not in Sqlite.features
  SQLITE_OMIT_BETWEEN_OPTIMIZATION not in Sqlite.features
  SQLITE_OMIT_BLOB_LITERAL not in Sqlite.features
  SQLITE_OMIT_BUILTIN_TEST not in Sqlite.features
  SQLITE_OMIT_CHECK in Sqlite.features
  SQLITE_OMIT_COMPILEOPTION_DIAGS not in Sqlite.features
  SQLITE_OMIT_COMPLETE in Sqlite.features
  SQLITE_OMIT_COMPOUND_SELECT not in Sqlite.features
  SQLITE_OMIT_DATETIME_FUNCS in Sqlite.features
  SQLITE_OMIT_DECLTYPE not in Sqlite.features
  SQLITE_OMIT_DEPRECATED in Sqlite.features
  SQLITE_OMIT_FOREIGN_KEY in Sqlite.features
  SQLITE_OMIT_GET_TABLE not in Sqlite.features
  SQLITE_OMIT_INCRBLOB in Sqlite.features
  SQLITE_OMIT_INTEGRITY_CHECK not in Sqlite.features
  SQLITE_OMIT_LIKE_OPTIMIZATION not in Sqlite.features
  SQLITE_OMIT_LOCALTIME in Sqlite.features
  SQLITE_OMIT_LOOKASIDE not in Sqlite.features
  SQLITE_OMIT_MEMORYDB in Sqlite.features
  SQLITE_OMIT_PAGER_PRAGMAS not in Sqlite.features
  SQLITE_OMIT_PRAGMA not in Sqlite.features
  SQLITE_OMIT_PROGRESS_CALLBACK not in Sqlite.features
  SQLITE_OMIT_QUICKBALANCE in Sqlite.features
  SQLITE_OMIT_REINDEX not in Sqlite.features
  SQLITE_OMIT_SCHEMA_PRAGMAS not in Sqlite.features
  SQLITE_OMIT_SCHEMA_VERSION_PRAGMAS in Sqlite.features
  SQLITE_OMIT_SHARED_CACHE not in Sqlite.features
  SQLITE_OMIT_TCL_VARIABLE not in Sqlite.features
  SQLITE_OMIT_TRACE in Sqlite.features
  SQLITE_OMIT_TRIGGER in Sqlite.features
  SQLITE_OMIT_UTF16 not in Sqlite.features
  SQLITE_OMIT_VIEW in Sqlite.features
  SQLITE_OMIT_VIRTUALTABLE not in Sqlite.features
  SQLITE_OMIT_XFER_OPT in Sqlite.features
  SQLITE_DEBUG not in Sqlite.features
  SQLITE_MEMDEBUG in Sqlite.features
}

inst config {
  12 Int,
  exactly 1 Sqlite
}

objectives o_global {
  minimize Sqlite.totalFootprint
}

run featureSet for config optimize o_global
