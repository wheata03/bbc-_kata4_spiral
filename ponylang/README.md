# bbc-_kata4_spiral

## Local Execution
1. Compile: `corral run -- ponyc -o bin spiral`
2. Run: `./bin/spiral [[1,2,3],[4,5,6],[7,8,9]]`

## Online execution:
1. Visit https://playground.ponylang.io
2. Copy+Paste `spiral/main.pony` into the editor
3. Replace the creation of `arr` in `Main.create` (lines 5 through 15 inclusive) with
```ponylang
    let arr = try
      Matrix.from_string("[[1,2,3,4],[5,6,7,8],[9,10,11,12]]")?.to_spiral()
    else recover val [as ISize: ] end end
```
4. Use the "Run" button above the editor
