# sennenki/js

Yet another JavaScript binding library for mbt test.

This library provides a set of types and functions to interact with JavaScript values from mbt test, focusing on type safety and idiomatic mbt test usage where possible.

## Features

- **Core JS Types**: bindings for `Any`, `Undefined`, `Null`, `Symbol`, `Object`.
- **Promises**: Full `Promise` support including creating, chaining (`then`, `catch_`, `finally_`), and combinators (`all`, `race`, `any`).
- **Traits**: Implementation of standard traits (`Show`, `Eq`, `Compare`, `Default`, `Hash`) for JS types.
- **Safety**: Helper wrapper types `Nullable[T]` and `Nullish[T]` to handle JS nullability safely.

## Usage

### Basic Types

```mbt test
let a = Any::new(42)
println(a.is_number()) // true

let obj = Object::new()
obj.set("key", 100)
let val : Int = obj.get("key")
println(val) // 100
```

### Promises

```mbt test
let p = Promise::new(fn(resolve, _reject) {
  // Simulate async work
  resolve(42)
})

let _ = p.map(fn(val) { val + 1 })
 .map(fn(val) { println(val) }) // Prints 43
```

### Async/Await

You can convert async functions to Promises:

```mbt test
let p = Promise::from_async(async fn() {
  let val = 100
  val
})
```

### Handling Null and Undefined

```mbt test
let x : Nullable[Int] = Nullable::new(10)
let y : Nullable[Int] = Nullable::null()

match x.to_option() {
  Some(v) => println(v)
  None => println("null")
}

let z : Nullish[Int] = Nullish::undefined()
// ...
```

## Comparisons and Equality

JS strict equality (`===`) is used for `Eq` implementation.
Abstract comparison is used for `Compare`.

```mbt test
let a = Any::new(1)
let b = Any::new(1)
println(a == b) // true
```
