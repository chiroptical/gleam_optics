import adapter.{type Adapter, Adapter, shift}
import gleeunit/should

type Left =
  #(#(Int, String), Bool)

type Right =
  #(Int, #(String, Bool))

pub fn shift_test() {
  let l: Adapter(Left, Left, Right, Right) = shift()

  let left: Left = #(#(1, "string"), True)
  let right: Right = #(1, #("string", True))

  l.from(left)
  |> should.equal(right)

  l.to(right)
  |> should.equal(left)
}
