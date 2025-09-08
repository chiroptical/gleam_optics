import affine.{type Affine, option_first}
import gleam/option.{type Option, None, Some}
import gleeunit/should

pub fn preview_one_test() {
  let l: Affine(#(Option(Int), String), #(Option(String), String), Int, String) =
    option_first()
  l.preview(#(Some(1), "hi"))
  |> should.equal(Error(1))
}

pub fn preview_two_test() {
  let l: Affine(#(Option(Int), String), #(Option(String), String), Int, String) =
    option_first()
  l.preview(#(None, "hi"))
  |> should.equal(Ok(#(None, "hi")))
}

pub fn set_one_test() {
  let l: Affine(#(Option(Int), String), #(Option(String), String), Int, String) =
    option_first()
  l.set(#("a", #(Some(1), "hi")))
  |> should.equal(#(Some("a"), "hi"))
}

pub fn set_two_test() {
  let l: Affine(#(Option(Int), String), #(Option(String), String), Int, String) =
    option_first()
  l.set(#("a", #(None, "hi")))
  |> should.equal(#(None, "hi"))
}

pub fn preview_set_test() {
  let l: Affine(#(Option(Int), String), #(Option(Int), String), Int, Int) =
    option_first()
  let s = #(Some(1), "hi")
  case l.preview(s) {
    Error(x) -> l.set(#(x, s))
    Ok(x) -> x
  }
}

pub fn set_preview_test() {
  let l: Affine(#(Option(Int), String), #(Option(Int), String), Int, Int) =
    option_first()
  let a = 2
  let s = #(Some(1), "hi")
  l.preview(l.set(#(a, s)))
  |> should.equal(case l.preview(s) {
    Error(_) -> Error(a)
    Ok(x) -> Ok(x)
  })
}

pub fn set_set_test() {
  let l: Affine(#(Option(Int), String), #(Option(Int), String), Int, Int) =
    option_first()
  let a1 = 2
  let a2 = 3
  let s = #(Some(1), "hi")
  l.set(#(a2, l.set(#(a1, s))))
  |> should.equal(l.set(#(a2, s)))
}
