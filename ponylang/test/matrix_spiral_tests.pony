use "../spiral"
use "ponytest"


primitive _MatrixSpiralTest is TestWrapped
	fun all_tests(): Array[UnitTest iso] =>
		[as UnitTest iso:

object iso is UnitTest
	fun name(): String => "matrix / spiral / size / 0x0"
	fun apply(h: TestHelper) ? =>
    let undertest: Matrix = Matrix.from_string("")?
    h.assert_array_eq[ISize]([], undertest.to_spiral())
end

object iso is UnitTest
	fun name(): String => "matrix / spiral / size / 1x1"
	fun apply(h: TestHelper) ? =>
    let undertest: Matrix = Matrix.from_string("[[1]]")?
    h.assert_array_eq[ISize]([1], undertest.to_spiral())
end

object iso is UnitTest
	fun name(): String => "matrix / spiral / size / 5x1"
	fun apply(h: TestHelper) ? =>
    let undertest: Matrix = Matrix.from_string("[[1,2,3,4,5]]")?
    h.assert_array_eq[ISize]([1;2;3;4;5], undertest.to_spiral())
end

object iso is UnitTest
	fun name(): String => "matrix / spiral / size / 1x5"
	fun apply(h: TestHelper) ? =>
    let undertest: Matrix = Matrix.from_string("[[1],[2],[3],[4],[5]]")?
    h.assert_array_eq[ISize]([1;2;3;4;5], undertest.to_spiral())
end

object iso is UnitTest
  fun name(): String => "matrix / spiral / size / 3x3"
	fun apply(h: TestHelper) ? =>
    let undertest: Matrix = Matrix.from_string("[[1,2,3],[4,5,6],[7,8,9]]")?
    h.assert_array_eq[ISize]([1;2;3;6;9;8;7;4;5], undertest.to_spiral())
end

]
