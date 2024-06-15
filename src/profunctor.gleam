// In theory, we are only every using this as evidence that 'p'
// is dependent on both 'a' and 'b'.
pub type Two(p, a, b) {
  Two(two: fn(#(a, b)) -> p)
}

pub type Profunctor(p, a, b, s, t) {
  // Is the inner one supposed to be 'Two(p, s, t)'?
  Profunctor(dimap: fn(#(fn(s) -> a, fn(b) -> t, Two(p, a, b))) -> Two(p, s, t))
}

pub type Market(a, b, s, t) {
  Market(bt: fn(b) -> t, sat: fn(s) -> Result(a, t))
}
// Try to implement this profunctor instance with the above
//
// instance Profunctor (Market a b) where
//   dimap f g (Market bt seta) = Market (g . bt) (either (Left . g) Right . seta . f)
// pub fn market_profunctor() -> Profunctor(p, a, b, s, t) {
//   let dimap = fn(d) {
//     // let f = d.0
//     // let g = d.1
//     // let Market(bt, sat) = d.2
//     todo
//   }
//   Profunctor(dimap)
// }
