import profunctor.{type Upstar, Upstar}

// first  :: p a b -> p (a, c) (b, c)
// second :: p a b -> p (c, a) (c, b)
// p a b           ~ p
// p (a, c) (b, c) ~ q
// p (c, a) (c, b) ~ r
pub type Cartesian(p, q, r) {
  Cartesian(first: fn(p) -> q, second: fn(p) -> r)
}

pub fn upstar_cartesian() -> Cartesian(
  Upstar(b, a),
  Upstar(#(b, c), #(a, c)),
  Upstar(#(c, b), #(c, a)),
) {
  let first = fn(p: Upstar(_, _)) {
    Upstar(run: fn(x: #(_, _)) { #(p.run(x.0), x.1) })
  }
  let second = fn(p: Upstar(_, _)) {
    Upstar(run: fn(x: #(_, _)) { #(x.0, p.run(x.1)) })
  }
  Cartesian(first, second)
}
