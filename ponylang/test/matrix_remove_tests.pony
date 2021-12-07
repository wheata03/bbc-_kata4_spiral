use "../spiral"
use "ponytest"


primitive _MatrixRemoveTest is TestWrapped
	fun all_tests(): Array[UnitTest iso] =>
		[as UnitTest iso:

object iso is UnitTest
  fun name(): String => "matrix / remove / top / at"
	fun apply(h: TestHelper) ? =>
    let undertest: Matrix = Matrix.from_string("[[1,2],[3,4]]")?
    h.assert_eq[ISize](3, undertest.remove(North).at(Coord(0,0)))
    h.assert_eq[ISize](4, undertest.remove(North).at(Coord(1,0)))
end

object iso is UnitTest
  fun name(): String => "matrix / remove / bottom / at"
	fun apply(h: TestHelper) ? =>
    let undertest: Matrix = Matrix.from_string("[[1,2],[3,4]]")?
    h.assert_eq[ISize](1, undertest.remove(South).at(Coord(0,0)))
    h.assert_eq[ISize](2, undertest.remove(South).at(Coord(1,0)))
end

object iso is UnitTest
  fun name(): String => "matrix / remove / left / at"
	fun apply(h: TestHelper) ? =>
    let undertest: Matrix = Matrix.from_string("[[1,2],[3,4]]")?
    h.assert_eq[ISize](2, undertest.remove(West).at(Coord(0,0)))
    h.assert_eq[ISize](4, undertest.remove(West).at(Coord(0,1)))
end

object iso is UnitTest
  fun name(): String => "matrix / remove / right / at"
	fun apply(h: TestHelper) ? =>
    let undertest: Matrix = Matrix.from_string("[[1,2],[3,4]]")?
    h.assert_eq[ISize](1, undertest.remove(East).at(Coord(0,0)))
    h.assert_eq[ISize](3, undertest.remove(East).at(Coord(0,1)))
end


object iso is UnitTest
  fun name(): String => "matrix / remove / top"
	fun apply(h: TestHelper) ? =>
    let undertest: Matrix = Matrix.from_string("[[1,2,3],[4,5,6],[7,8,9]]")?
    h.assert_array_eq[ISize]([4;5;6], undertest.remove(North).line(North))
end

object iso is UnitTest
  fun name(): String => "matrix / remove / bottom"
	fun apply(h: TestHelper) ? =>
    let undertest: Matrix = Matrix.from_string("[[1,2,3],[4,5,6],[7,8,9]]")?
    h.assert_array_eq[ISize]([6;5;4], undertest.remove(South).line(South))
end

object iso is UnitTest
  fun name(): String => "matrix / remove / left"
	fun apply(h: TestHelper) ? =>
    let undertest: Matrix = Matrix.from_string("[[1,2,3],[4,5,6],[7,8,9]]")?
    h.assert_array_eq[ISize]([8;5;2], undertest.remove(West).line(West))
end

object iso is UnitTest
  fun name(): String => "matrix / remove / right"
	fun apply(h: TestHelper) ? =>
    let undertest: Matrix = Matrix.from_string("[[1,2,3],[4,5,6],[7,8,9]]")?
    h.assert_array_eq[ISize]([2;5;8], undertest.remove(East).line(East))
end

]
