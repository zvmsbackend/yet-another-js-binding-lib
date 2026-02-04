///|
/// Represents a JavaScript Promise.
#external
pub type Promise[T]

extern "js" fn Promise::then_ffi(self : Any, onfulfilled : Any) -> Any =
  #|(self, onfulfilled) => self.then(onfulfilled)

///|
/// Chains a Promise with a function that returns another Promise.
pub fn[T, U] Promise::flat_map(self : Promise[T], f : (T) -> Promise[U]) -> Promise[U] {
  Promise::then_ffi(Any::new(self), Any::new(f)).unsafe_as()
}

///|
/// Chains a Promise with a function that returns a value.
pub fn[T, U] Promise::map(self : Promise[T], f : (T) -> U) -> Promise[U] {
  Promise::then_ffi(Any::new(self), Any::new(f)).unsafe_as()
}

extern "js" fn Promise::catch_ffi(self : Any, onrejected : Any) -> Any =
  #|(self, onrejected) => self.catch(onrejected)

///|
/// Catches a rejection with a function that returns another Promise.
pub fn[T, U] Promise::flat_except(self : Promise[T], f : (Any) -> Promise[U]) -> Promise[U] {
  Promise::catch_ffi(Any::new(self), Any::new(f)).unsafe_as()
}

///|
/// Catches a rejection with a function that returns a value.
pub fn[T, U] Promise::catch_(self : Promise[T], f : (Any) -> U) -> Promise[U] {
  Promise::catch_ffi(Any::new(self), Any::new(f)).unsafe_as()
}

extern "js" fn Promise::finally_ffi(self : Any, onfinally : Any) -> Any =
  #|(self, onfinally) => self.finally(onfinally)

///|
/// Adds a handler to be called when the Promise is settled (either fulfilled or rejected).
pub fn[T] Promise::finally_(self : Promise[T], onfinally : () -> Unit) -> Promise[T] {
  Promise::finally_ffi(Any::new(self), Any::new(onfinally)).unsafe_as()
}

extern "js" fn Promise::new_ffi(executor : Any) -> Any =
  #|(executor) => new Promise(executor)

///|
/// Creates a new Promise.
pub fn[T] Promise::new(executor: ((T) -> Unit, (Any) -> Unit) -> Unit) -> Promise[T] {
  Promise::new_ffi(Any::new(executor)).unsafe_as()
}

extern "js" fn Promise::resolve_ffi(value : Any) -> Any =
  #|(value) => Promise.resolve(value)

///|
/// Creates a Promise that is resolved with the given value.
pub fn[T] Promise::resolve(value : T) -> Promise[T] {
  Promise::resolve_ffi(Any::new(value)).unsafe_as()
}

///|
/// Flattens a Promise of a Promise.
pub fn[T] Promise::flatten(self : Promise[Promise[T]]) -> Promise[T] {
  Promise::resolve_ffi(Any::new(self)).unsafe_as()
}

extern "js" fn Promise::reject_ffi(reason : Any) -> Any =
  #|(reason) => Promise.reject(reason)

///|
/// Creates a Promise that is rejected with the given reason.
pub fn[T] Promise::reject(reason : Any) -> Promise[T] {
  Promise::reject_ffi(reason).unsafe_as()
}

extern "js" fn Promise::all_ffi(iterable : Any) -> Any =
  #|(iterable) => Promise.all(iterable)

///|
/// Returns a single Promise that resolves when all of the promises in the iterable argument have resolved
/// or when the iterable argument contains no promises. It rejects with the reason of the first promise that rejects.
pub fn[T] Promise::all(iterable : Array[Promise[T]]) -> Promise[Array[T]] {
  Promise::all_ffi(Any::new(iterable)).unsafe_as()
}

extern "js" fn Promise::any_ffi(iterable : Any) -> Any =
  #|(iterable) => Promise.any(iterable)

///|
/// Returns a single Promise that resolves as soon as any of the promises in the iterable fulfills,
/// with the value of the fulfilled promise. If no promises in the iterable fulfill (if all of the given promises are rejected),
/// then the returned promise is rejected with an AggregateError.
pub fn[T] Promise::any(iterable : Array[Promise[T]]) -> Promise[T] {
  Promise::any_ffi(Any::new(iterable)).unsafe_as()
}

extern "js" fn Promise::race_ffi(iterable : Any) -> Any =
  #|(iterable) => Promise.race(iterable)

///|
/// Returns a promise that fulfills or rejects as soon as one of the promises in an iterable fulfills or rejects,
/// with the value or reason from that promise.
pub fn[T] Promise::race(iterable : Array[Promise[T]]) -> Promise[T] {
  Promise::race_ffi(Any::new(iterable)).unsafe_as()
}

///|
/// Represents a set of functions to resolve or reject a Promise.
#warnings("-struct_never_constructed")
pub struct Resolvers[T] {
  promise : Promise[T]
  resolve : (T) -> Unit
  reject : (Any) -> Unit
}

extern "js" fn Promise::with_resolvers_ffi() -> Any =
  #|() => Promise.withResolvers()

///|
/// Creates a new Promise and returns the resolve and reject functions along with the promise.
pub fn[T] Promise::with_resolvers() -> Resolvers[T] {
  Promise::with_resolvers_ffi().unsafe_as()
}

///|
/// Runs an async function.
pub fn run_async(f : async () -> Unit noraise) -> Unit noraise = "%async.run"

///|
/// Converts an async function which may raise error to a Promise.
pub fn[T] Promise::from_async(f : async () -> T) -> Promise[T] {
  let { promise, resolve, reject } = Promise::with_resolvers()
  run_async(async fn () noraise {
    try {
      resolve(f())
    } catch {
      e => reject(Any::new(e))
    }
  })
  promise
}
