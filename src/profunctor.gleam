// In theory, we are only every using this as evidence that 'p'
// is dependent on both 'a' and 'b'.
pub type Two(p, a, b) {
  Two(two: fn(#(a, b)) -> p)
}

// dimap :: (a -> b) -> (c -> d) -> p b c -> p a d
pub type Profunctor(p, q, a, b, c, d) {
  // Is the inner one supposed to be 'Two(p, s, t)'?
  Profunctor(dimap: fn(#(fn(a) -> b, fn(c) -> d, Two(p, b, c))) -> Two(q, a, d))
}

pub type Limits(a, b) {
  Limits(step: fn(a) -> #(b, b), check: fn(#(a, a)) -> Bool)
}

// pub fn limits_profunctor() -> Profunctor(Limits(b, c), Limits(a, d), a, b, c, d) {
//   let dimap = fn(input: #(fn(a) -> b, fn(c) -> d, Two(Limits(b, c), b, c))) {
//     Two(two: fn(_inner: #(a, d)) {
//       // fn(a) -> b
//       let _g = input.0
//       // fn(c) -> d
//       let _h = input.1
//       // fn(#(a, b)) -> Limits(a, b)
//       let Two(_two) = input.2
//       // fn(a) -> #(b, b)
//       let step = todo
//       // fn(#(a, a)) -> Bool
//       let check = todo
//       Limits(step, check)
//     })
//   }
//   Profunctor(dimap)
// }

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
