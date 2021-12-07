use "../spiral"
use "ponytest"


primitive _MatrixParseTest is TestWrapped
	fun all_tests(): Array[UnitTest iso] =>
		[as UnitTest iso:

object iso is UnitTest
	fun name(): String => "matrix / parse / size / 0x0"
	fun apply(h: TestHelper) ? =>
    let undertest: Matrix = Matrix.from_string("")?
    h.assert_eq[USize](0, undertest.width)
    h.assert_eq[USize](0, undertest.height)
end

object iso is UnitTest
	fun name(): String => "matrix / parse / size / 1x1"
	fun apply(h: TestHelper) ? =>
    let undertest: Matrix = Matrix.from_string("[[1]]")?
    h.assert_eq[USize](1, undertest.width)
    h.assert_eq[USize](1, undertest.height)
end

object iso is UnitTest
	fun name(): String => "matrix / parse / size / 1x2"
	fun apply(h: TestHelper) ? =>
    let undertest: Matrix = Matrix.from_string("[[1],[2]]")?
    h.assert_eq[USize](1, undertest.width)
    h.assert_eq[USize](2, undertest.height)
end

object iso is UnitTest
	fun name(): String => "matrix / parse / size / 2x1"
	fun apply(h: TestHelper) ? =>
    let undertest: Matrix = Matrix.from_string("[[1,2]]")?
    h.assert_eq[USize](2, undertest.width)
    h.assert_eq[USize](1, undertest.height)
end

object iso is UnitTest
	fun name(): String => "matrix / parse / size / 3x3"
	fun apply(h: TestHelper) ? =>
    let undertest: Matrix = Matrix.from_string("[[1,2,3],[4,5,6],[7,8,9]]")?
    h.assert_eq[USize](3, undertest.width)
    h.assert_eq[USize](3, undertest.height)
end


object iso is UnitTest
	fun name(): String => "matrix / parse / at / 1x1 / 0,0"
	fun apply(h: TestHelper) ? =>
    let undertest: Matrix = Matrix.from_string("[[1]]")?
    h.assert_eq[ISize](1, undertest.at(Coord(0,0)))
end

object iso is UnitTest
	fun name(): String => "matrix / parse / at / 1x2 / 0,1"
	fun apply(h: TestHelper) ? =>
    let undertest: Matrix = Matrix.from_string("[[1],[2]]")?
    h.assert_eq[ISize](2, undertest.at(Coord(0,1)))
end

object iso is UnitTest
	fun name(): String => "matrix / parse / at / 2x1 / 1,0"
	fun apply(h: TestHelper) ? =>
    let undertest: Matrix = Matrix.from_string("[[1,2]]")?
    h.assert_eq[ISize](2, undertest.at(Coord(1,0)))
end

object iso is UnitTest
	fun name(): String => "matrix / parse / at / 3x3 / 2,2"
	fun apply(h: TestHelper) ? =>
    let undertest: Matrix = Matrix.from_string("[[1,2,3],[4,5,6],[7,8,9]]")?
    h.assert_eq[ISize](9, undertest.at(Coord(2,2)))
end

object iso is UnitTest
	fun name(): String => "matrix / parse / at / 1x9 / 0,6"
	fun apply(h: TestHelper) ? =>
    let undertest: Matrix = Matrix.from_string("[[1],[2],[3],[4],[5],[6],[7],[8],[9]]")?
    h.assert_eq[ISize](7, undertest.at(Coord(0,6)))
end

object iso is UnitTest
	fun name(): String => "matrix / parse / at / 9x1 / 6,0"
	fun apply(h: TestHelper) ? =>
    let undertest: Matrix = Matrix.from_string("[[1,2,3,4,5,6,7,8,9]]")?
    h.assert_eq[ISize](7, undertest.at(Coord(6,0)))
end
]
