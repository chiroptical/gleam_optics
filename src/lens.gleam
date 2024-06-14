pub type Lens(s, t, a, b) {
  Lens(view: fn(s) -> a, update: fn(b, s) -> t)
}

pub fn one() -> Lens(#(a, c), #(b, c), a, b) {
  let v = fn(x: #(a, c)) { x.0 }
  let u = fn(x: b, y: #(a, c)) { #(x, y.1) }
  Lens(view: v, update: u)
}

// Clumsy... Apparently pro-functors make this better?
pub fn compose(l1: Lens(s, t, a, b), l2: Lens(a, b, c, d)) -> Lens(s, t, c, d) {
  let Lens(v1, u1) = l1
  let Lens(v2, u2) = l2
  let v = fn(x: s) { v2(v1(x)) }
  let u = fn(d: d, s: s) { u1(u2(d, v1(s)), s) }
  Lens(v, u)
}
