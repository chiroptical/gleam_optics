import profunctor.{type Upstar, Upstar}

// class Profunctor p => Monoidal p where
//   par   :: p a b -> p c d -> p (a, c) (b, d)
//   empty :: p () ()
// p a b ~ p
// p c d ~ q
// p (a, c) (b, d) ~ r
// p () () ~ s
pub type Monoidal(p, q, r, s) {
  Monoidal(par: fn(#(p, q)) -> r, empty: s)
}

pub fn upstar_monoidal() -> Monoidal(
  Upstar(b, a),
  Upstar(d, c),
  Upstar(#(b, d), #(a, c)),
  Upstar(Nil, Nil),
) {
  // TODO: we don't have Applicative here but I guess par is intended to be parallel
  let par = fn(pq: #(Upstar(b, a), Upstar(d, c))) {
    Upstar(run: fn(x: #(_, _)) { #({ pq.0 }.run(x.0), { pq.1 }.run(x.1)) })
  }
  let empty = Upstar(run: fn(x) { x })
  Monoidal(par, empty)
}
