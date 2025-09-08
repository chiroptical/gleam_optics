pub type Adapter(s, t, a, b) {
  Adapter(from: fn(s) -> a, to: fn(b) -> t)
}

pub fn shift() -> Adapter(
  #(#(a, b), c),
  #(#(x, y), z),
  #(a, #(b, c)),
  #(x, #(y, z)),
) {
  let from = fn(x: #(#(a, b), c)) { #(x.0.0, #(x.0.1, { x.1 })) }
  let to = fn(x: #(x, #(y, z))) { #(#({ x.0 }, x.1.0), x.1.1) }
  Adapter(from, to)
}
