// dimap :: (a -> b) -> (c -> d) -> p b c -> p a d
// p b c -> c b
// p a d -> d a
pub type Profunctor(p, q, a, b, c, d) {
  Profunctor(dimap: fn(#(fn(a) -> b, fn(c) -> d, p)) -> q)
}

pub type Upstar(f, a) {
  Upstar(run: fn(a) -> f)
}

pub fn upstar_profunctor() -> Profunctor(Upstar(c, b), Upstar(d, a), a, b, c, d) {
  let dimap = fn(inp: #(fn(a) -> b, fn(c) -> d, Upstar(c, b))) {
    let f = inp.0
    let g = inp.1
    let Upstar(run) = inp.2
    Upstar(run: fn(x) { g(run(f(x))) })
  }
  Profunctor(dimap)
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
