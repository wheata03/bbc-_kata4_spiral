use "../spiral"
use "ponytest"


primitive _MatrixLineTest is TestWrapped
	fun all_tests(): Array[UnitTest iso] =>
		[as UnitTest iso:

object iso is UnitTest
  fun name(): String => "matrix / line / top"
	fun apply(h: TestHelper) ? =>
    let undertest: Matrix = Matrix.from_string("[[1,2,3],[4,5,6],[7,8,9]]")?
    h.assert_array_eq[ISize]([1;2;3], undertest.line(North))
end

object iso is UnitTest
  fun name(): String => "matrix / line / bottom"
	fun apply(h: TestHelper) ? =>
    let undertest: Matrix = Matrix.from_string("[[1,2,3],[4,5,6],[7,8,9]]")?
    h.assert_array_eq[ISize]([9;8;7], undertest.line(South))
end

object iso is UnitTest
  fun name(): String => "matrix / line / left"
	fun apply(h: TestHelper) ? =>
    let undertest: Matrix = Matrix.from_string("[[1,2,3],[4,5,6],[7,8,9]]")?
    h.assert_array_eq[ISize]([7;4;1], undertest.line(West))
end

object iso is UnitTest
  fun name(): String => "matrix / line / right"
	fun apply(h: TestHelper) ? =>
    let undertest: Matrix = Matrix.from_string("[[1,2,3],[4,5,6],[7,8,9]]")?
    h.assert_array_eq[ISize]([3;6;9], undertest.line(East))
end

]
