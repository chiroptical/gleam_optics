import adapter.{type Adapter, Adapter, shift}
import gleeunit/should

type Left =
  #(#(Int, String), Bool)

type Right =
  #(Int, #(String, Bool))

pub fn from_to_test() {
  let l: Adapter(Left, Left, Right, Right) = shift()
  let x: Left = #(#(1, "string"), True)
  l.to(l.from(x))
  |> should.equal(x)
}

pub fn to_from_test() {
  let l: Adapter(Left, Left, Right, Right) = shift()
  let x: Right = #(1, #("string", True))
  l.from(l.to(x))
  |> should.equal(x)
}

pub fn shift_test() {
  let l: Adapter(Left, Left, Right, Right) = shift()

  let left: Left = #(#(1, "string"), True)
  let right: Right = #(1, #("string", True))

  l.from(left)
  |> should.equal(right)

  l.to(right)
  |> should.equal(left)
}
