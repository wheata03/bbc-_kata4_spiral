

actor Main
  new create(env: Env) =>
    let arr: Array[ISize] val = try
        let str = try
          env.args(1)?
        else
          env.out.print("paramater required")
          "[]"
        end
        Matrix.from_string(str)?.to_spiral()
      else
        [as ISize: ]
      end

    var not_first: Bool = false
    env.out.write("[")
    for v in arr.values() do
      if (not_first) then
        env.out.write(",")
      end
      not_first = true
      env.out.write(v.string())
    end
    env.out.write("]\n")

class val Coord
  let x: USize
  let y: USize
  new val create(x': USize, y': USize) =>
    x = x'
    y = y'
  fun add(other: Coord): Coord =>
    Coord(x + other.x, y + other.y)

interface Dir
  fun next(): Direction
  fun start(width: USize, height: USize): Coord
  fun element_count(width: USize, height: USize): USize
  fun move(coord: Coord): Coord
  fun remove_offset(coord: Coord): Coord
  fun remove_width(w: USize): USize
  fun remove_height(h: USize): USize

primitive East is Dir
  fun next(): Direction => South
  fun start(width: USize, height: USize): Coord => Coord(width-1,0)
  fun element_count(width: USize, height: USize): USize => height
  fun move(coord: Coord): Coord => Coord(coord.x, coord.y+1)
  fun remove_offset(coord: Coord): Coord => Coord(coord.x, coord.y)
  fun remove_width(w: USize): USize => w-1
  fun remove_height(h: USize): USize => h
primitive South is Dir
  fun next(): Direction => West
  fun start(width: USize, height: USize): Coord => Coord(width-1,height-1)
  fun element_count(width: USize, height: USize): USize => width
  fun move(coord: Coord): Coord => Coord(coord.x-1, coord.y)
  fun remove_offset(coord: Coord): Coord => Coord(coord.x, coord.y)
  fun remove_width(w: USize): USize => w
  fun remove_height(h: USize): USize => h-1
primitive West is Dir
  fun next(): Direction => North
  fun start(width: USize, height: USize): Coord => Coord(0,height-1)
  fun element_count(width: USize, height: USize): USize => height
  fun move(coord: Coord): Coord => Coord(coord.x, coord.y-1)
  fun remove_offset(coord: Coord): Coord => Coord(coord.x+1, coord.y)
  fun remove_width(w: USize): USize => w-1
  fun remove_height(h: USize): USize => h
primitive North is Dir
  fun next(): Direction => East
  fun start(width: USize, height: USize): Coord => Coord(0,0)
  fun element_count(width: USize, height: USize): USize => width
  fun move(coord: Coord): Coord => Coord(coord.x+1, coord.y)
  fun remove_offset(coord: Coord): Coord => Coord(coord.x, coord.y+1)
  fun remove_width(w: USize): USize => w
  fun remove_height(h: USize): USize => h-1
type Direction is (North | East | South | West)


class val Matrix
  let data: Array[ISize] val
  let data_width: USize
  let width: USize
  let height: USize
  let offset: Coord

  new val from_string(str: String val) ? =>
    if str.size() < 4 then
      data = [as ISize: ]
      width = 0
      data_width = 0
      height = 0
      offset = Coord(0,0)
      return
    end
    let comma_count: USize = str.count(",")
    let open_count: USize = str.count("[")
    height = open_count - 1
    width = (comma_count + 1) / height
    data_width = width

    data = recover val
      let data': Array[ISize] trn = recover trn Array[ISize](width * height) end

      let splits: Array[String] = str.split("[], ")
      for spl in splits.values() do
        if (spl.size() > 0) then
          data'.push(spl.isize()?)
        end
      end
      consume data'
    end

    offset = Coord(0,0)

  new val from(data': Array[ISize] val, data_width': USize, offset': Coord, width': USize, height': USize) =>
    data = data'
    data_width = data_width'
    offset = offset'
    width = width'
    height = height'

  fun val remove(dir: Direction): Matrix val =>
    from(data,
        data_width,
        dir.remove_offset(offset),
        dir.remove_width(width),
        dir.remove_height(height))

  fun val at(coord: Coord): ISize =>
    try data(((offset.y+coord.y)*(data_width)) + coord.x + offset.x)? else 0 end

  fun val line(dir: Direction): Array[ISize] val =>
    recover val
      let r = Array[ISize]()
      var c: USize = dir.element_count(width, height)
      var current = dir.start(width, height)
      while c > 0 do
        r.push(at(current))
        current = dir.move(current)
        c = c - 1
      end
      r
    end

  fun val to_spiral(): Array[ISize] val =>
    _to_spiral(North)

  fun val _to_spiral(dir: Direction): Array[ISize] val =>
    if (width == 0) or (height == 0) then return [as ISize: ] end
    recover val
      let r = Array[ISize](data.size())
      r.append(line(dir))
      r.>append(remove(dir)._to_spiral(dir.next()))
    end
