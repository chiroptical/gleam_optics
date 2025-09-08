pub type Traversal(s, t, a, b) {
  Traversal(contents: fn(s) -> List(a), fill: fn(#(List(b), s)) -> t)
}

pub fn first_and_second() -> Traversal(#(a, a, c), #(b, b, c), a, b) {
  let contents = fn(input: #(a, a, c)) { [input.0, input.1] }
  let fill = fn(input: #(List(b), #(a, a, c))) {
    case input.0 {
      [x, y, ..] -> #(x, y, input.1.2)
      _ -> panic as "list doesn't have first and second"
    }
  }
  Traversal(contents, fill)
}
