import gleam/option.{type Option, None, Some}
import gleeunit/should
import prism.{type Prism, the}

pub fn match_one_test() {
  let l: Prism(Option(Int), Option(String), Int, String) = the()
  let x: Option(Int) = Some(1)
  l.match(x)
  |> should.equal(Error(1))
}

pub fn match_two_test() {
  let l: Prism(Option(Int), Option(String), Int, String) = the()
  let x: Option(Int) = None
  l.match(x)
  |> should.equal(Ok(None))
}

pub fn match_three_test() {
  let l: Prism(Option(Int), Option(String), Int, String) = the()
  l.build("hello")
  |> should.equal(Some("hello"))
}

pub fn match_build_test() {
  let l: Prism(Option(Int), Option(Int), Int, Int) = the()
  let s = Some(1)
  case l.match(s) {
    Ok(x) -> x
    Error(x) -> l.build(x)
  }
  |> should.equal(s)
}

pub fn build_match_test() {
  let l: Prism(Option(Int), Option(Int), Int, Int) = the()
  l.match(l.build(1))
  |> should.equal(Error(1))
}
