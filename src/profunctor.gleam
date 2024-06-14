// Unsure how to represent that p is dependent on a, b and q is dependent on s,
// t. Maybe it doesn't matter?
pub type Profunctor(p, q, a, b, s, t) {
  Profunctor(dimap: fn(#(fn(s) -> a, fn(b) -> t, p)) -> q)
}
