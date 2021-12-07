use "../spiral"
use "ponytest"


primitive _DirectionTest is TestWrapped
	fun all_tests(): Array[UnitTest iso] =>
		[as UnitTest iso:

object iso is UnitTest
	fun name(): String => "direction / east / start"
	fun apply(h: TestHelper) =>
    let result = East.start(3,3)
    h.assert_eq[USize](2, result.x)
    h.assert_eq[USize](0, result.y)
end

object iso is UnitTest
	fun name(): String => "direction / south / start"
	fun apply(h: TestHelper) =>
    let result = South.start(3,3)
    h.assert_eq[USize](2, result.x)
    h.assert_eq[USize](2, result.y)
end

object iso is UnitTest
	fun name(): String => "direction / west / start"
	fun apply(h: TestHelper) =>
    let result = West.start(3,3)
    h.assert_eq[USize](0, result.x)
    h.assert_eq[USize](2, result.y)
end

object iso is UnitTest
	fun name(): String => "direction / north / start"
	fun apply(h: TestHelper) =>
    let result = North.start(3,3)
    h.assert_eq[USize](0, result.x)
    h.assert_eq[USize](0, result.y)
end

object iso is UnitTest
	fun name(): String => "direction / north / element count"
	fun apply(h: TestHelper) =>
    h.assert_eq[USize](3, North.element_count(3,6))
end

object iso is UnitTest
	fun name(): String => "direction / east / element count"
	fun apply(h: TestHelper) =>
    h.assert_eq[USize](6, East.element_count(3,6))
end

object iso is UnitTest
	fun name(): String => "direction / south / element count"
	fun apply(h: TestHelper) =>
    h.assert_eq[USize](3, North.element_count(3,6))
end

object iso is UnitTest
	fun name(): String => "direction / west / element count"
	fun apply(h: TestHelper) =>
    h.assert_eq[USize](6, West.element_count(3,6))
end

object iso is UnitTest
	fun name(): String => "direction / north / move"
	fun apply(h: TestHelper) =>
    let result = North.move(Coord(3,3))
    h.assert_eq[USize](4, result.x)
    h.assert_eq[USize](3, result.y)
end

object iso is UnitTest
	fun name(): String => "direction / east / move"
	fun apply(h: TestHelper) =>
    let result = East.move(Coord(3,3))
    h.assert_eq[USize](3, result.x)
    h.assert_eq[USize](4, result.y)
end

object iso is UnitTest
	fun name(): String => "direction / south / move"
	fun apply(h: TestHelper) =>
    let result = South.move(Coord(3,3))
    h.assert_eq[USize](2, result.x)
    h.assert_eq[USize](3, result.y)
end

object iso is UnitTest
	fun name(): String => "direction / west / move"
	fun apply(h: TestHelper) =>
    let result = West.move(Coord(3,3))
    h.assert_eq[USize](3, result.x)
    h.assert_eq[USize](2, result.y)
end





]
