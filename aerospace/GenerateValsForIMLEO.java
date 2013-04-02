public class GenerateValsForIMLEO {

	private static final double dVeod = 11100;
	private static final double dVmoe = 3840;
	private static final double dVdom = 6798;
	private static final double dVmoa = 7468;
	private static final double dvMod = 3661;
	private static final double g = 9.8 * 100 / 30;
	private static final double Isp1 = 315;
	private static final double Isp2 = 425;
	private static final double f = 0.08;

	private static enum FuelType {
		NA, CRYOGENIC, STORABLE
	}


	// Mass ratio : mass final / mass initial
	//checked
	private static double R(double deltaV, double specImp) {
		double x = (deltaV / (specImp * g));
		double ratio = java.lang.Math.exp(-1.0 * x);
		return ratio;
	}

	// Mass ratio between total / payload
	// checked
	private static double Rt2p(double deltaV, double specImp, double f) {
		double r = R(deltaV, specImp);
		return 1 / (r - f + (f * r));
	}

	// returns total initial mass of just this stage ( minus payload )
	// checked
	private static double calcStageMass(double deltaV, double specImp, double mpay,
			double f) {
		double totalPayRatio = Rt2p(deltaV, specImp, f);
		return (totalPayRatio * (mpay) - mpay);
	}

	// checked
	private static double cmMassCalc(int cmCrew) {
		if (cmCrew == 2) {
			return 8000;
		} else if (cmCrew == 3) {
			return 11000;
		}
		return 0;
	}

	// checked
	private static double lmMassCalc(int lmCrew) {
		if (lmCrew == 1) {
			return 3000;
		} else if (lmCrew == 2) {
			return 4000;
		} else if (lmCrew == 3) {
			return 5000;
		}
		return 0;
	}

	// checked
	private static double sm4MassCalc(double cmMass, double Isp) {
		// use Isp1 for now ( storable )
		return calcStageMass(dvMod, Isp, cmMass, f);
	}

	// checked
	private static double lm2MassCalc(boolean LOR, double lmMass, double Isp) {
		if (LOR == false) {
			return 0;
		}
		if (LOR == true) {
			return calcStageMass(dVmoa, Isp, lmMass, f);
		}
		return 0;
	}

	// checked
	private static double lm1MassCalc(boolean LOR, double lm2Mass, double lmMass,
			double Isp) {
		if (LOR == false) {
			return 0;
		} else if (LOR == true) {
			double mpay = lm2Mass + lmMass;
			return calcStageMass(dVdom, Isp, mpay, f);
		}
		return 0;
	}

	// checked
	private static double lmTotalMassCalc(double lm1Mass, double lm2Mass, double lmMass) {
		return lm1Mass + lm2Mass + lmMass;
	}

	// checked
	private static double sm3MassCalc(boolean LOR, double sm4Mass, double cmMass,
			double Isp) {

		double mpay = 0;

		if (LOR == true) {
			return 0;
		}
		if (LOR == false) {
			mpay = sm4Mass + cmMass;
		}
		return calcStageMass(dVmoa, Isp, mpay, f);
	}

	// checked
	private static double sm2MassCalc(boolean LOR, double sm3Mass, double sm4Mass,
			double cmMass, double Isp) {
		if (LOR == true) {
			return 0;
		}
		if (LOR == false) {
			double mpay = sm3Mass + sm4Mass + cmMass;
			return calcStageMass(dVdom, Isp, mpay, f);
		}
		return 0;
	}

	// checked
	private static double sm1MassCalc(double lmTotalMass, double sm2Mass,
			double sm3Mass, double sm4Mass, double cmMass, double Isp) {
		double mpay = lmTotalMass + sm2Mass + sm3Mass + sm4Mass + cmMass;
		return calcStageMass(dVmoe, Isp, mpay, f);
	}

	// checked
	private static double smTotalMassCalc(double sm1Mass, double sm2Mass,
			double sm3Mass, double sm4Mass) {
		return sm1Mass + sm2Mass + sm3Mass + sm4Mass;
	}

	// checked
	private static double s4MassCalc(double smTotalMass, double lmTotalMass,
			double cmMass) {
		double mpay = smTotalMass + lmTotalMass + cmMass;
		return calcStageMass(dVeod, Isp2, mpay, f);
	}

	// checked
	private static double calcIsp(FuelType fuelType) {
		if (fuelType == FuelType.CRYOGENIC) {
			return Isp2;
		} else if (fuelType == FuelType.STORABLE) {
			return Isp1;
		}
		return Isp1;
	}

	private static double calcIMLEO(boolean LOR, int cmCrew, int lmCrew,
			FuelType smFuel, FuelType lmFuel) {

		double cmMass = cmMassCalc(cmCrew);
		double sm4Mass = sm4MassCalc(cmMass, calcIsp(smFuel));
		double lmMass = lmMassCalc(lmCrew);
		double lm2Mass = lm2MassCalc(LOR, lmMass, calcIsp(lmFuel));
		double lm1Mass = lm1MassCalc(LOR, lm2Mass, lmMass, calcIsp(lmFuel));
		double lmTotalMass = lmTotalMassCalc(lm1Mass, lm2Mass, lmMass);
		double sm3Mass = sm3MassCalc(LOR, sm4Mass, cmMass, calcIsp(smFuel));
		double sm2Mass = sm2MassCalc(LOR, sm3Mass, sm4Mass, cmMass,
				calcIsp(smFuel));
		double sm1Mass = sm1MassCalc(lmTotalMass, sm2Mass, sm3Mass, sm4Mass,
				cmMass, calcIsp(smFuel));
		double smTotalMass = smTotalMassCalc(sm1Mass, sm2Mass, sm3Mass, sm4Mass);
		double s4Mass = s4MassCalc(smTotalMass, lmTotalMass, cmMass);
		double IMLEO = s4Mass + smTotalMass + lmTotalMass + cmMass;

		return IMLEO;
	}

  public static void main(String[] args) {
    final boolean PRINT_ALLOY = true;

    boolean LOR;
    int cmCrew;
    int lmCrew;
    FuelType smFuel;
    FuelType lmFuel;

    for (int a = 0; a <= 1; a++) {
      LOR = (a == 1);

      for (int b = 2; b <= 3; b++) {
        cmCrew = b;

        for (int c = 0; c <= 3; c++) {
          lmCrew = c;

          for (int d = 1; d <= 2; d++) {
            smFuel = (d == 1) ? FuelType.CRYOGENIC : FuelType.NA;

            for (int e = 1; e <= 2; e++) {
              lmFuel = (e == 1) ? FuelType.CRYOGENIC : FuelType.NA;

              // Divide by 10000, then round to nearest int
              long val = Math.round( calcIMLEO(LOR, cmCrew, lmCrew, smFuel, lmFuel) / 10000 );

              if (PRINT_ALLOY) {
                System.out.print("fact { (");

                if (LOR) {
                  System.out.print("lor_yes in Apollo.choices");
                } else {
                  System.out.print("lor_no in Apollo.choices");
                }
                System.out.print(" and ");

                System.out.print("cmCrew_" + b + " in Apollo.choices");
                System.out.print(" and ");

                System.out.print("lmCrew_" + c + " in Apollo.choices");
                System.out.print(" and " );

                System.out.print("smFuel_cryogenic");
                if (d != 1) {
                  System.out.print(" not");
                }
                System.out.print(" in Apollo.choices");
                System.out.print(" and ");

                System.out.print("smFuel_cryogenic");
                if (e != 1) {
                  System.out.print(" not");
                }
                System.out.print(" in Apollo.choices");

                System.out.print(") => Apollo.totalIMLEO = ");
                System.out.print(val);
                System.out.println("}");
              } else {
                System.out.println(val);
              }
            }
          }
        }
      }
    }
  }

}
