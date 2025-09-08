import gleam/option.{type Option, None, Some}

pub type Affine(s, t, a, b) {
  Affine(preview: fn(s) -> Result(t, a), set: fn(#(b, s)) -> t)
}

pub fn option_first() -> Affine(#(Option(a), c), #(Option(b), c), a, b) {
  let preview = fn(input: #(Option(a), c)) {
    case input.0 {
      None -> Ok(#(None, input.1))
      Some(x) -> Error(x)
    }
  }
  let set = fn(input: #(b, #(Option(a), c))) {
    #(
      case input.1.0 {
        None -> None
        Some(_) -> Some(input.0)
      },
      input.1.1,
    )
  }
  Affine(preview, set)
}
