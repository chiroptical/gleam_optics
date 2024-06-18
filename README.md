# optics

## Sources

- https://github.com/hablapps/DontFearTheProfunctorOptics
- https://www.schoolofhaskell.com/school/to-infinity-and-beyond/pick-of-the-week/profunctors
- https://www.youtube.com/watch?v=OJtGECfksds

## TODO

- Optics
  - [x] Adapter laws in `test/adapter_test.gleam`
  - [x] Prism i.e. https://github.com/hablapps/DontFearTheProfunctorOptics/blob/master/Optics.md#prism
  - [x] Affine i.e. https://github.com/hablapps/DontFearTheProfunctorOptics/blob/master/Optics.md#affine
  - [x] Traversal i.e. https://github.com/hablapps/DontFearTheProfunctorOptics/blob/master/Optics.md#traversal
- Profunctors 2/3
  - https://github.com/hablapps/DontFearTheProfunctorOptics/blob/master/Profunctors.md
  - [x] Define Cartesian
    ```haskell
    class Profunctor p => Cartesian p where
        first  :: p a b -> p (a, c) (b, c)
        second :: p a b -> p (c, a) (c, b)
    ```
  - [x] Define Cocartesian
    ```haskell
    class Profunctor p => Cocartesian p where
      left  :: p a b -> p (Either a c) (Either b c)
      right :: p a b -> p (Either c a) (Either c b)
    ```
  - [ ] Define Monoidal
    ```haskell
    class Profunctor p => Monoidal p where
      par   :: p a b -> p c d -> p (a, c) (b, d)
      empty :: p () ()
    ```
  - [x] Implement Cartesian for `Upstar`
  - [x] Implement Cocartesian for `Upstar`
  - [ ] Implement Monoidal for `Upstar`
  - [ ] Implement Profunctor for `Downstar` (`newtype DownStar f a b = DownStar { runDownStar :: f a -> b }`)
  - [ ] Implement Cartesian for `Downstar`
  - [ ] Implement Cocartesian for `Downstar`
  - [ ] Implement Monoidal for `Downstar`
  - [ ] Implement Profunctor for `Tagged` (`newtype Tagged a b = Tagged { :: b }`)
  - [ ] Implement Cartesian for `Tagged`
  - [ ] Implement Cocartesian for `Tagged`
  - [ ] Implement Monoidal for `Tagged`

[![Package Version](https://img.shields.io/hexpm/v/optics)](https://hex.pm/packages/optics)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/optics/)

```sh
gleam add optics
```
```gleam
import optics

pub fn main() {
  // TODO: An example of the project in use
}
```

Further documentation can be found at <https://hexdocs.pm/optics>.

## Development

```sh
gleam run   # Run the project
gleam test  # Run the tests
gleam shell # Run an Erlang shell
```
