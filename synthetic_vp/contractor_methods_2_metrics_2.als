open util/integer

abstract sig Contractor {
}

fun methods [] : Contractor -> ContractorMethod {
    Contractor_A -> Contractor_A_Method_1 +
    Contractor_A -> Contractor_A_Method_2 
}

fun contractor_value_units [] : Contractor -> ValueUnit {
  methods.value_units
}

fun value_unit_contractor [] : ValueUnit -> Contractor {
  ~contractor_value_units
}

abstract sig ContractorMethod {
}

fun value_units [] : ContractorMethod -> ValueUnit {
  ~contractor_method
}

fun contractor [] : ContractorMethod -> Contractor {
  ~methods
}

abstract sig ValueUnit {
  criterion_C1_value : one Int,
  criterion_C2_value : one Int,
  contractor_method : one ContractorMethod
}

one sig ValueUnit_VU1 extends ValueUnit {
}
{
  criterion_C1_value = contractor_method.value_unit_VU1_criterion_C1_values
  criterion_C2_value = contractor_method.value_unit_VU1_criterion_C2_values
}
one sig ValueUnit_VU2 extends ValueUnit {
}
{
  criterion_C1_value = contractor_method.value_unit_VU2_criterion_C1_values
  criterion_C2_value = contractor_method.value_unit_VU2_criterion_C2_values
}
one sig ValueUnit_VU3 extends ValueUnit {
}
{
  criterion_C1_value = contractor_method.value_unit_VU3_criterion_C1_values
  criterion_C2_value = contractor_method.value_unit_VU3_criterion_C2_values
}
one sig ValueUnit_VU4 extends ValueUnit {
}
{
  criterion_C1_value = contractor_method.value_unit_VU4_criterion_C1_values
  criterion_C2_value = contractor_method.value_unit_VU4_criterion_C2_values
}
one sig ValueUnit_VU5 extends ValueUnit {
}
{
  criterion_C1_value = contractor_method.value_unit_VU5_criterion_C1_values
  criterion_C2_value = contractor_method.value_unit_VU5_criterion_C2_values
}

one sig Contractor_A extends Contractor {
}

one sig Contractor_A_Method_1 extends ContractorMethod {
}


one sig Contractor_A_Method_2 extends ContractorMethod {
}


one sig Problem {
  criterion_C1_total : one Int,
  criterion_C2_total : one Int
}
{
  criterion_C1_total = ( sum vu : ValueUnit | vu.criterion_C1_value )
  criterion_C2_total = ( sum vu : ValueUnit | vu.criterion_C2_value )
}

fact { all c : Contractor | (# c.contractor_value_units) <= 2 }

fun value_unit_VU1_criterion_C1_values [] : ContractorMethod -> Int {
  Contractor_A_Method_1 -> 1 +
  Contractor_A_Method_2 -> 2 
}
fun value_unit_VU1_criterion_C2_values [] : ContractorMethod -> Int {
  Contractor_A_Method_1 -> 2 +
  Contractor_A_Method_2 -> 1 
}
fun value_unit_VU2_criterion_C1_values [] : ContractorMethod -> Int {
  Contractor_A_Method_1 -> 2 +
  Contractor_A_Method_2 -> 3 
}
fun value_unit_VU2_criterion_C2_values [] : ContractorMethod -> Int {
  Contractor_A_Method_1 -> 3 +
  Contractor_A_Method_2 -> 2 
}
fun value_unit_VU3_criterion_C1_values [] : ContractorMethod -> Int {
  Contractor_A_Method_1 -> 3 +
  Contractor_A_Method_2 -> 4 
}
fun value_unit_VU3_criterion_C2_values [] : ContractorMethod -> Int {
  Contractor_A_Method_1 -> 4 +
  Contractor_A_Method_2 -> 3 
}
fun value_unit_VU4_criterion_C1_values [] : ContractorMethod -> Int {
  Contractor_A_Method_1 -> 4 +
  Contractor_A_Method_2 -> 5 
}
fun value_unit_VU4_criterion_C2_values [] : ContractorMethod -> Int {
  Contractor_A_Method_1 -> 5 +
  Contractor_A_Method_2 -> 4 
}
fun value_unit_VU5_criterion_C1_values [] : ContractorMethod -> Int {
  Contractor_A_Method_1 -> 5 +
  Contractor_A_Method_2 -> 6 
}
fun value_unit_VU5_criterion_C2_values [] : ContractorMethod -> Int {
  Contractor_A_Method_1 -> 6 +
  Contractor_A_Method_2 -> 5 
}

inst config {
  12 Int
}

objectives o_global {
  maximize Problem.criterion_C1_total,
  maximize Problem.criterion_C2_total
}

pred show {
}

run show for config optimize o_global
