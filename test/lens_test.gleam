import gleeunit/should
import lens.{type Lens, Lens, one}

pub fn view_update_test() {
  let l: Lens(#(Int, String), #(Int, String), Int, Int) = one()
  let s = #(1, "hello")
  l.update(l.view(s), s)
  |> should.equal(s)
}

pub fn update_view_test() {
  let l: Lens(#(Int, String), #(Int, String), Int, Int) = one()
  let s = #(1, "hello")
  let a = 3
  l.view(l.update(a, s))
  |> should.equal(a)
}

pub fn update_update_test() {
  let l: Lens(#(Int, String), #(Int, String), Int, Int) = one()
  let s = #(1, "hello")
  let a1 = 3
  let a2 = 4
  l.update(a2, l.update(a1, s))
  |> should.equal(l.update(a2, s))
}
