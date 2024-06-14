import gleam/option.{type Option, None, Some}

pub type Prism(s, t, a, b) {
  Prism(match: fn(s) -> Result(t, a), build: fn(b) -> t)
}

pub fn the() -> Prism(Option(a), Option(b), a, b) {
  let match = fn(oa: Option(a)) {
    case oa {
      None -> Ok(None)
      Some(a) -> Error(a)
    }
  }
  let build = fn(a) { Some(a) }
  Prism(match, build)
}
