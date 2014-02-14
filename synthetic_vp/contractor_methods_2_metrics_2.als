abstract sig ContractorMethod {
	value_units : set ValueUnit,

	criterion_1_values : ValueUnit -> Int,
    criterion_2_values : ValueUnit -> Int
}

abstract sig ValueUnit {
	contractor_method : one ContractorMethod,

	criterion_1_value : Int,
	criterion_2_value : Int
}
{
	criterion_1_value = contractor_method.criterion_1_values[this]
	criterion_2_value = contractor_method.criterion_2_values[this]
}

one sig VU1, VU2, VU3, VU4, VU5 extends ValueUnit {

}

one sig ContractorMethodA1 extends ContractorMethod {
}
{
	criterion_1_values = 
		VU1 -> 1 +
		VU2 -> 2 +
		VU3 -> 3 +
		VU4 -> 4 +
		VU5 -> 5

	criterion_2_values =
		VU1 -> 2 +
		VU2 -> 3 +
		VU3 -> 4 +
		VU4 -> 5 +
		VU5 -> 6
}

one sig ContractorMethodA2 extends ContractorMethod {
}
{
	criterion_1_values = 
		VU1 -> 2 +
		VU2 -> 3 +
		VU3 -> 4 +
		VU4 -> 5 +
		VU5 -> 6

	criterion_2_values =
		VU1 -> 1 +
		VU2 -> 2 +
		VU3 -> 3 +
		VU4 -> 4 +
		VU5 -> 5
}

one sig Problem {
	criterion_1_total : Int,
	criterion_2_total : Int
}
{
	criterion_1_total = (sum vu : ValueUnit | vu.criterion_1_value)
	criterion_2_total = (sum vu : ValueUnit | vu.criterion_2_value)
}

fact { all vu : ValueUnit | one cm : ContractorMethod | vu in cm.value_units }
fact { value_units = ~(contractor_method) }

inst config {
  10 Int
}

objectives o_global {
  maximize Problem.criterion_1_total,
  maximize Problem.criterion_2_total
}

pred show {
}

run show for config optimize o_global
