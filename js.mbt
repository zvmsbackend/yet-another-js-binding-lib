fn [T, U] unsafe_as(obj : T) -> U = "%identity"

///|
/// Represents TypeScript type `any`.
#external
pub type Any

///|
/// Creates an `any` from arbitrary object.
pub fn[T] Any::new(obj : T) -> Any = "%identity"

///|
/// Casts an `any` to arbitrary type without runtime check.
pub fn[T] Any::unsafe_as(obj : Any) -> T = "%identity"

///|
/// Checks if the `any` is a number.
pub extern "js" fn Any::is_number(self : Any) -> Bool = "(self) => typeof self === 'number'"

///|
/// Checks if the `any` is a string.
pub extern "js" fn Any::is_string(self : Any) -> Bool = "(self) => typeof self === 'string'"

///|
/// Checks if the `any` is a boolean.
pub extern "js" fn Any::is_boolean(self : Any) -> Bool = "(self) => typeof self === 'boolean'"

///|
/// Checks if the `any` is an object (excluding null).
pub extern "js" fn Any::is_object(self : Any) -> Bool = "(self) => typeof self === 'object' && self !== null"

///|
/// Checks if the `any` is an object or null.
pub extern "js" fn Any::is_object_or_null(self : Any) -> Bool = "(self) => typeof self === 'object'"

///|
/// Checks if the `any` is a function.
pub extern "js" fn Any::is_function(self : Any) -> Bool = "(self) => typeof self === 'function'"

///|
/// Checks if the `any` is undefined.
pub extern "js" fn Any::is_undefined(self : Any) -> Bool = "(self) => typeof self === 'undefined'"

///|
/// Checks if the `any` is null.
pub extern "js" fn Any::is_null(self : Any) -> Bool = "(self) => self === null"

///|
/// Checks if the `any` is a symbol.
pub extern "js" fn Any::is_symbol(self : Any) -> Bool = "(self) => typeof self === 'symbol'"

///|
/// Checks if the `any` is a bigint.
pub extern "js" fn Any::is_bigint(self : Any) -> Bool = "(self) => typeof self === 'bigint'"

extern "js" fn Any::equal_ffi(self : Any, other : Any) -> Bool = "(self, other) => self === other"

pub impl Eq for Any with equal(self, other) {
  self.equal_ffi(other)
}

extern "js" fn Any::compare_ffi(self : Any, other : Any) -> Int =
  #|(self, other) => {
  #|  if (self === other) return 0;
  #|  return self < other ? -1 : 1;
  #|}

pub impl Compare for Any with compare(self, other) {
  self.compare_ffi(other)
}

extern "js" fn Any::to_string_ffi(self : Any) -> String = "(self) => self.toString()"

pub impl Show for Any with to_string(self) {
  self.to_string_ffi()
}

pub impl Show for Any with output(self, logger) {
  logger.write_string(self.to_string_ffi())
}

///|
/// Represents the `undefined` value in JavaScript.
#external
pub type Undefined

///|
/// Creates an `undefined` value.
pub extern "js" fn Undefined::new() -> Undefined = "() => undefined"

pub impl Default for Undefined with default() {
  Undefined::new()
}

pub impl Eq for Undefined with equal(_, _) {
  true
}

pub impl Compare for Undefined with compare(_, _) {
  0
}

pub impl Hash for Undefined with hash(_) {
  0
}

pub impl Hash for Undefined with hash_combine(_, hasher) {
  hasher.combine_int(0)
}

pub impl Show for Undefined with to_string(_) {
  "undefined"
}

pub impl Show for Undefined with output(_, logger) {
  logger.write_string("undefined")
}

///|
/// Represents the `null` value in JavaScript.
#external
pub type Null

///|
/// Creates a `null` value.
pub extern "js" fn Null::new() -> Null = "() => null"

pub impl Default for Null with default() {
  Null::new()
}

pub impl Eq for Null with equal(_, _) {
  true
}

pub impl Compare for Null with compare(_, _) {
  0
}

pub impl Hash for Null with hash(_) {
  0
}

pub impl Hash for Null with hash_combine(_, hasher) {
  hasher.combine_int(0)
}

pub impl Show for Null with to_string(_) {
  "null"
}

pub impl Show for Null with output(_, logger) {
  logger.write_string("null")
}

///|
/// Represents a JavaScript Symbol.
#external
pub type Symbol

///|
/// Creates a new unique Symbol.
pub extern "js" fn Symbol::new() -> Symbol = "() => Symbol()"

///|
/// Creates a new unique Symbol with a description.
pub extern "js" fn Symbol::from_string_fresh(name : String) -> Symbol = "(name) => Symbol(name)"

///|
/// Returns a Symbol for the given key from the global symbol registry.
pub extern "js" fn Symbol::from_string_existing(name : String) -> Symbol = "(name) => Symbol.for(name)"

///|
/// Returns the key for the given Symbol from the global symbol registry.
pub extern "js" fn Symbol::key(self : Symbol) -> String? = "(self) => Symbol.keyFor(self)"

pub impl Eq for Symbol with equal(self, other) {
  Any::new(self).equal_ffi(Any::new(other))
}

pub impl Compare for Symbol with compare(self, other) {
  Any::new(self).compare_ffi(Any::new(other))
}

pub impl Show for Symbol with to_string(self) {
  Any::new(self).to_string_ffi()
}

pub impl Show for Symbol with output(self, logger) {
  logger.write_string(Any::new(self).to_string_ffi())
}

///|
/// Represents a JavaScript Object.
#external
pub type Object

///|
/// Trait for types that can be used as object keys (String or Symbol).
pub trait StringOrSymbol {}
pub impl StringOrSymbol for String
pub impl StringOrSymbol for Symbol

///|
/// Creates a new empty Object.
pub extern "js" fn Object::new() -> Object = "() => ({})"

extern "js" fn Object::from_pair_ffi(key : Any, val : Any) -> Object = "(key, val) => { let obj = {}; obj[key] = val; return obj; }"

///|
/// Creates an Object with a single key-value pair.
#warnings("-unused_trait_bound")
pub fn[K : StringOrSymbol, T] Object::from_pair(key : K, val : T) -> Object {
  Object::from_pair_ffi(Any::new(key), Any::new(val))
}

extern "js" fn Object::set_ffi(self : Object, key : Any, val : Any) -> Unit = "(self, key, val) => self[key] = val"

///|
/// Sets a property on the object.
#alias("_[_]=_")
#warnings("-unused_trait_bound")
pub fn[K : StringOrSymbol, T] Object::set(self : Object, key : K, val : T) -> Unit {
  self.set_ffi(Any::new(key), Any::new(val))
}

extern "js" fn Object::get_ffi(self : Object, key : Any) -> Any = "(self, key) => self[key]"

///|
/// Gets a property from the object.
#alias("_[_]")
#warnings("-unused_trait_bound")
pub fn[K : StringOrSymbol, T] Object::get(self : Object, key : K) -> T {
  self.get_ffi(Any::new(key)).unsafe_as()
}

///|
/// Casts the object to an arbitrary type.
pub fn[T] Object::unsafe_as(self : Object) -> T {
  unsafe_as(self)
}

pub impl Default for Object with default() {
  Object::new()
}

pub impl Eq for Object with equal(self, other) {
  Any::new(self).equal_ffi(Any::new(other))
}

pub impl Compare for Object with compare(self, other) {
  Any::new(self).compare_ffi(Any::new(other))
}

pub impl Show for Object with to_string(self) {
  Any::new(self).to_string_ffi()
}

pub impl Show for Object with output(self, logger) {
  logger.write_string(Any::new(self).to_string_ffi())
}

///|
/// Represents a value that can be null.
#external
pub type Nullable[T]

///|
/// Checks if the value is null.
pub fn[T] Nullable::is_null(self : Nullable[T]) -> Bool {
  Any::new(self).is_null()
}

///|
/// Creates a Nullable from a value.
pub fn[T] Nullable::new(value : T) -> Nullable[T] {
  unsafe_as(value)
}

///|
/// Creates a null Nullable.
pub fn[T] Nullable::null() -> Nullable[T] {
  unsafe_as(Null::new())
}

///|
/// Unwraps the value. Unsafe if null.
pub fn[T] Nullable::unwrap(self : Nullable[T]) -> T = "%identity"

///|
/// Creates a Nullable from an Option.
pub fn[T] Nullable::from_option(opt : T?) -> Nullable[T] {
  match opt {
    Some(value) => Nullable::new(value)
    None => Nullable::null()
  }
}

///|
/// Creates a Nullable from a Nullish.
pub fn[T] Nullable::from_nullish(nullish : Nullish[T]) -> Nullable[T] {
  if nullish.is_null_or_undefined() {
    Nullable::null()
  } else {
    Nullable::new(nullish.unwrap())
  }
}

///|
/// Converts to an Option.
pub fn[T] Nullable::to_option(self : Nullable[T]) -> T? {
  let any = Any::new(self)
  if any.is_null() {
    None
  } else {
    Some(any.unsafe_as())
  }
}

pub impl[T : Eq] Eq for Nullable[T] with equal(self, other) {
  if self.is_null() && other.is_null() {
    true
  } else if self.is_null() || other.is_null() {
    false
  } else {
    self.unwrap().equal(other.unwrap())
  }
}

pub impl[T : Compare] Compare for Nullable[T] with compare(self, other) {
  if self.is_null() && other.is_null() {
    0
  } else if self.is_null() {
    -1
  } else if other.is_null() {
    1
  } else {
    self.unwrap().compare(other.unwrap())
  }
}

pub impl[T : Hash] Hash for Nullable[T] with hash(self) {
  if self.is_null() {
    0
  } else {
    self.unwrap().hash()
  }
}

pub impl[T : Hash] Hash for Nullable[T] with hash_combine(self, hasher) {
  if self.is_null() {
    hasher.combine_int(0)
  } else {
    hasher..combine_int(1)..combine(self.unwrap())
  }
}

pub impl[T : Show] Show for Nullable[T] with to_string(self) {
  if self.is_null() {
    "null"
  } else {
    self.unwrap().to_string()
  }
}

pub impl[T : Show] Show for Nullable[T] with output(self, logger) {
  if self.is_null() {
    logger.write_string("null")
  } else {
    self.unwrap().output(logger)
  }
}

///|
/// Represents a value that can be null or undefined.
#external
pub type Nullish[T]

///|
/// Creates a Nullish from a value.
pub fn[T] Nullish::new(value : T) -> Nullish[T] {
  unsafe_as(value)
}

///|
/// Creates an undefined Nullish.
pub fn[T] Nullish::undefined() -> Nullish[T] {
  unsafe_as(Undefined::new())
}

///|
/// Creates a null Nullish.
pub fn[T] Nullish::null() -> Nullish[T] {
  unsafe_as(Null::new())
}

///|
/// Unwraps the value. Unsafe if null or undefined.
pub fn[T] Nullish::unwrap(self : Nullish[T]) -> T = "%identity"

///|
/// Checks if the value is null or undefined.
pub fn[T] Nullish::is_null_or_undefined(self : Nullish[T]) -> Bool {
  let any = Any::new(self)
  any.is_null() || any.is_undefined()
}

///|
/// Checks if the value is null.
pub fn[T] Nullish::is_null(self : Nullish[T]) -> Bool {
  Any::new(self).is_null()
}

///|
/// Checks if the value is undefined.
pub fn[T] Nullish::is_undefined(self : Nullish[T]) -> Bool {
  Any::new(self).is_undefined()
}

///|
/// Creates a Nullish from an Option.
pub fn[T] Nullish::from_option(opt : T?) -> Nullish[T] {
  match opt {
    Some(value) => Nullish::new(value)
    None => Nullish::undefined()
  }
}

///|
/// Creates a Nullish from a Nullable.
pub fn[T] Nullish::from_nullable(nullable : Nullable[T]) -> Nullish[T] {
  if nullable.is_null() {
    Nullish::null()
  } else {
    Nullish::new(nullable.unwrap())
  }
}

///|
/// Converts to an Option.
pub fn[T] Nullish::to_option(self : Nullish[T]) -> T? {
  if self.is_null_or_undefined() {
    None
  } else {
    Some(self.unwrap())
  }
}

///|
/// Converts to a Nullable.
pub fn[T] Nullish::to_nullable(self : Nullish[T]) -> Nullable[T] {
  if self.is_null_or_undefined() {
    Nullable::null()
  } else {
    Nullable::new(self.unwrap())
  }
}

///|
/// Checks if the value is defined (not null or undefined).
pub fn[T] Nullish::is_defined(self : Nullish[T]) -> Bool {
  !self.is_null_or_undefined()
}

pub impl[T : Eq] Eq for Nullish[T] with equal(self, other) {
  if self.is_null_or_undefined() && other.is_null_or_undefined() {
    true
  } else if self.is_null_or_undefined() || other.is_null_or_undefined() {
    false
  } else {
    self.unwrap().equal(other.unwrap())
  }
}

pub impl[T : Compare] Compare for Nullish[T] with compare(self, other) {
  if self.is_null_or_undefined() && other.is_null_or_undefined() {
    0
  } else if self.is_null_or_undefined() {
    -1
  } else if other.is_null_or_undefined() {
    1
  } else {
    self.unwrap().compare(other.unwrap())
  }
}

pub impl[T : Hash] Hash for Nullish[T] with hash(self) {
  if self.is_null_or_undefined() {
    0
  } else {
    self.unwrap().hash()
  }
}

pub impl[T : Hash] Hash for Nullish[T] with hash_combine(self, hasher) {
  if self.is_null_or_undefined() {
    hasher.combine_int(0)
  } else {
    hasher..combine_int(1)..combine(self.unwrap())
  }
}

pub impl[T : Show] Show for Nullish[T] with to_string(self) {
  if self.is_null() {
    "null"
  } else if self.is_undefined() {
    "undefined"
  } else {
    self.unwrap().to_string()
  }
}

pub impl[T : Show] Show for Nullish[T] with output(self, logger) {
  if self.is_null() {
    logger.write_string("null")
  } else if self.is_undefined() {
    logger.write_string("undefined")
  } else {
    self.unwrap().output(logger)
  }
}
