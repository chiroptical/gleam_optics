import gleam/result.{map, map_error}
import profunctor.{type Upstar, Upstar}

// class Profunctor p => Cocartesian p where
//     left  :: p a b -> p (Either a c) (Either b c)
//     right :: p a b -> p (Either c a) (Either c b)
// p a b                       ~ p
// p (Either a c) (Either b c) ~ q
// p (Either c a) (Either c b) ~ r
pub type Cocartesian(p, q, r) {
  Cocartesian(first: fn(p) -> q, second: fn(p) -> r)
}

pub fn upstar_cocartesian() -> Cocartesian(
  Upstar(b, a),
  Upstar(Result(c, b), Result(c, a)),
  Upstar(Result(b, c), Result(a, c)),
) {
  let first = fn(p: Upstar(_, _)) {
    Upstar(run: fn(x: Result(_, _)) { map_error(x, p.run) })
  }
  let second = fn(p: Upstar(_, _)) {
    Upstar(run: fn(x: Result(_, _)) { map(x, p.run) })
  }
  Cocartesian(first, second)
}
