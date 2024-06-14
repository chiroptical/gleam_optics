// In theory, we are only every using this as evidence that 'p'
// is dependent on both 'a' and 'b'.
pub type Two(p, a, b) {
  Two(two: fn(#(a, b)) -> p)
}

pub type Profunctor(p, q, a, b, s, t) {
  Profunctor(dimap: fn(#(fn(s) -> a, fn(b) -> t, Two(p, a, b))) -> Two(q, s, t))
}
