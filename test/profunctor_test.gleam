import gleam/int
import gleam/io
import gleeunit/should
import profunctor.{type Profunctor, type Upstar, Upstar, upstar_profunctor}

pub fn upstar_test() {
  let l: Profunctor(
    Upstar(#(Int, Int), Int),
    Upstar(Int, #(Int, Int)),
    #(Int, Int),
    Int,
    #(Int, Int),
    Int,
  ) = upstar_profunctor()

  // i.e. we sandwich `Upstar.run` inbetween left and right
  let next =
    l.dimap(#(
      fn(x: #(Int, Int)) {
        let result = x.0 + x.1
        io.println("left " <> int.to_string(result))
        result
      },
      fn(y: #(Int, Int)) {
        let result = y.0 * y.1
        io.println("right " <> int.to_string(result))
        result
      },
      Upstar(run: fn(x) {
        io.println("upstar " <> int.to_string(x))
        #(x, x)
      }),
    ))

  // left runs: 1 + 2 = 3
  // upstar runs: #(3, 3)
  // right runs: 3 * 3 = 9
  next.run(#(1, 2))
  |> should.equal(9)
}
