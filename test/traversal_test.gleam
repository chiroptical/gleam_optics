import gleeunit/should
import traversal.{type Traversal, first_and_second}

pub fn contents_one_test() {
  let l: Traversal(#(Int, Int, String), #(Int, Int, String), Int, Int) =
    first_and_second()
  l.contents(#(1, 2, "hi"))
  |> should.equal([1, 2])
}

pub fn fill_one_test() {
  let l: Traversal(#(Int, Int, String), #(String, String, String), Int, String) =
    first_and_second()
  l.fill(#(["a", "b"], #(1, 2, "hi")))
  |> should.equal(#("a", "b", "hi"))
}
