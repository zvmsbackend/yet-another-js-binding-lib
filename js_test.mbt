test "Any checks" {
  let num = Any::new(123)
  inspect(num.is_number(), content="true")
  inspect(num.is_string(), content="false")
  
  let str = Any::new("abc")
  inspect(str.is_string(), content="true")
  inspect(str.is_number(), content="false")

  let bool_val = Any::new(true)
  inspect(bool_val.is_boolean(), content="true")

  let undefined_val = Any::new(Undefined::new())
  inspect(undefined_val.is_undefined(), content="true")

  let null_val = Any::new(Null::new())
  inspect(null_val.is_null(), content="true")
  inspect(null_val.is_object_or_null(), content="true")
  // Note: typeof null === 'object' in JS
  inspect(null_val.is_object(), content="false") 
}

test "Any equality" {
  let a = Any::new(1)
  let b = Any::new(1)
  let c = Any::new(2)
  inspect(a == b, content="true")
  inspect(a == c, content="false")
}

test "Any compare" {
  let a = Any::new(1)
  let b = Any::new(2)
  inspect(a < b, content="true")
  inspect(b > a, content="true")
  inspect(a.compare(b), content="-1")
}

test "Symbol" {
  let s1 = Symbol::new()
  let s2 = Symbol::new()
  inspect(s1 == s2, content="false")
  
  let s3 = Symbol::from_string_existing("test_symbol_key")
  let s4 = Symbol::from_string_existing("test_symbol_key")
  inspect(s3 == s4, content="true")
  
  inspect(s3.key(), content="Some(\"test_symbol_key\")")
}

test "Object" {
  let obj = Object::new()
  obj.set("a", 1)
  obj.set("b", "hello")
  
  inspect((obj.get("a") : Int), content="1")
  inspect((obj.get("b") : String), content="hello")
  
  let obj2 = Object::from_pair("c", true)
  inspect((obj2.get("c") : Bool), content="true")
}

test "Nullable" {
  let n1 = Nullable::new(10)
  inspect(n1.is_null(), content="false")
  inspect(n1.unwrap(), content="10")
  inspect(n1.to_option(), content="Some(10)")

  let n2 : Nullable[Int] = Nullable::null()
  inspect(n2.is_null(), content="true")
  inspect(n2.to_option(), content="None")
  
  inspect(Nullable::from_option(Some(5)).unwrap(), content="5")
  inspect(Nullable::from_option((None : Int?)).is_null(), content="true")
}

test "Nullish" {
  let n1 = Nullish::new(10)
  inspect(n1.is_null_or_undefined(), content="false")
  inspect(n1.is_defined(), content="true")
  
  let n2 : Nullish[Int] = Nullish::undefined()
  inspect(n2.is_undefined(), content="true")
  inspect(n2.is_null(), content="false")
  inspect(n2.is_null_or_undefined(), content="true")
  
  let n3 : Nullish[Int] = Nullish::null()
  inspect(n3.is_null(), content="true")
  inspect(n3.is_undefined(), content="false")
  inspect(n3.is_null_or_undefined(), content="true")
  
  inspect(Nullish::from_option(Some(1)).unwrap(), content="1")
  inspect(Nullish::from_option((None : Int?)).is_undefined(), content="true")
  
  inspect(Nullish::from_nullable(Nullable::new(10)).unwrap(), content="10")
  inspect(Nullish::from_nullable((Nullable::null() : Nullable[Int])).is_null(), content="true")
}

test "Promise::with_resolvers" {
  let resolvers : Resolvers[Int] = Promise::with_resolvers()
  // Just check we can create it and it has the fields
  let p = resolvers.promise
  let _ = resolvers.resolve
  let _ = resolvers.reject
  inspect(Any::new(p).is_object(), content="true")
}
test "Any checks extended" {
  let func = Any::new(fn() { () })
  inspect(func.is_function(), content="true")
  
  let sym = Any::new(Symbol::new())
  inspect(sym.is_symbol(), content="true")
}

test "Symbol traits" {
  let s = Symbol::new()
  inspect(s.compare(s), content="0")
  inspect(s.to_string(), content="Symbol()")
}


test "Object traits" {
  let o = Object::new()
  inspect(o == o, content="true")
  inspect(o.compare(o), content="0")
  inspect(o.to_string(), content="[object Object]")
  let _ : Object = Default::default() // check default
}

test "Nullable traits" {
  let n1 = Nullable::new(10)
  let n2 = Nullable::new(10)
  let n3 = Nullable::new(20)
  let null_val : Nullable[Int] = Nullable::null()
  
  // Eq
  inspect(n1 == n2, content="true")
  inspect(n1 == n3, content="false")
  inspect(n1 == null_val, content="false")
  inspect(null_val == null_val, content="true")
  
  // Compare
  inspect(n1.compare(n2), content="0")
  inspect(n1.compare(n3), content="-1")
  inspect(null_val.compare(null_val), content="0")
  inspect(null_val.compare(n1), content="-1")
  inspect(n1.compare(null_val), content="1")
  
  // Show
  inspect(n1.to_string(), content="10")
  inspect(null_val.to_string(), content="null")
  
  // Hash (call only)
  let _ = n1.hash()
  let _ = null_val.hash()
}

test "Nullish conversions" {
  let n1 = Nullish::new(10)
  let n2 : Nullish[Int] = Nullish::undefined()
  let n3 : Nullish[Int] = Nullish::null()

  // to_nullable
  inspect(n1.to_nullable().unwrap(), content="10")
  inspect(n2.to_nullable().is_null(), content="true") // undefined -> null
  inspect(n3.to_nullable().is_null(), content="true") // null -> null
  
  // to_option
  inspect(n1.to_option(), content="Some(10)")
  inspect(n2.to_option(), content="None")
}

test "Nullish traits" {
  let v = Nullish::new(10)
  let u : Nullish[Int] = Nullish::undefined()
  let n : Nullish[Int] = Nullish::null()
  
  // Eq
  inspect(u == u, content="true")
  inspect(n == n, content="true")
  inspect(u == n, content="true") // both match is_null_or_undefined
  inspect(v == v, content="true")
  inspect(v == u, content="false")
  
  // Compare
  inspect(u.compare(n), content="0")
  inspect(u.compare(v), content="-1")
  inspect(v.compare(u), content="1")
  inspect(v.compare(v), content="0")
  
  // Show
  inspect(u.to_string(), content="undefined")
  inspect(n.to_string(), content="null")
  inspect(v.to_string(), content="10")
  
  // Hash
  let _ = u.hash()
  let _ = n.hash()
  let _ = v.hash()
}

test "Undefined traits" {
  let u : Undefined = Default::default()
  inspect(u == u, content="true")
  inspect(u.compare(u), content="0")
  inspect(u.to_string(), content="undefined")
  let _ = u.hash()
}

test "Null traits" {
  let n : Null = Default::default()
  inspect(n == n, content="true")
  inspect(n.compare(n), content="0")
  inspect(n.to_string(), content="null")
  let _ = n.hash()
}

// Promise tests (mocking async behavior slightly or mainly checking compilation/types)
test "Promise::resolve_reject" {
  let p1 : Promise[Int] = Promise::resolve(42)
  // Rejection without handler causes Node to crash in strict mode or print warning
  // We attach a catch handler to suppress unhandled rejection error
  let p2 : Promise[Int] = (Promise::reject(Any::new("error")) : Promise[Int]).catch_(fn(_err) { 0 })
  inspect(Any::new(p1).is_object(), content="true")
  inspect(Any::new(p2).is_object(), content="true")
}

// Note: Testing actual async completion often requires async test support or callbacks.
// We can test that methods return expected promise objects.
test "Promise chaining structure" {
  let p = Promise::resolve(1)
  let p2 = p.map(fn(x) { x + 1 })
  inspect(Any::new(p2).is_object(), content="true")
  
  let p3 = p2.flat_map(fn(x) { Promise::resolve(x * 2) })
  inspect(Any::new(p3).is_object(), content="true")
}

test "Coverage - Traits and extra methods" {
  // Any Show
  let a = Any::new(42)
  inspect(a, content="42")

  // Undefined Show/Hash
  let u = Undefined::new()
  inspect(u, content="undefined")
  let _ = u.hash()

  // Null Show/Hash
  let n = Null::new()
  inspect(n, content="null")
  let _ = n.hash()

  // Symbol Show
  let s = Symbol::from_string_existing("sym")
  inspect(s, content="Symbol(sym)")

  // Object Show & unsafe_as
  let obj = Object::new()
  inspect(obj, content="[object Object]")
  let _ : Any = obj.unsafe_as()

  // Nullable from_nullish
  let nv : Nullish[Int] = Nullish::new(10)
  let na = Nullable::from_nullish(nv)
  inspect(na.unwrap(), content="10")

  let nu : Nullish[Int] = Nullish::undefined()
  let nb = Nullable::from_nullish(nu)
  inspect(nb.is_null(), content="true")

  // Nullable Show/Hash branch coverage
  let nnull : Nullable[Int] = Nullable::null()
  inspect(nnull, content="null")
  let _ = nnull.hash()

  // Nullish Show/Hash branch coverage
  let undef : Nullish[Int] = Nullish::undefined()
  inspect(undef, content="undefined")
  let _ = undef.hash()
  
  let nullish_null : Nullish[Int] = Nullish::null()
  inspect(nullish_null, content="null")
  let _ = nullish_null.hash()
}

test "Coverage - Promise extended" {
  let p = Promise::resolve(1)
  
  // finally_
  let _ = p.finally_(fn() { () })
  
  // flat_except
  let _ = p.flat_except((fn(_e) { Promise::resolve(0) }))

  // new
  let _ : Promise[Int] = Promise::new(fn(resolve, _reject) { resolve(1) })

  // flatten
  let pp = Promise::resolve(Promise::resolve(1))
  let _ = pp.flatten()

  // all
  let _ = Promise::all([p])

  // any
  let _ = Promise::any([p])

  // race
  let _ = Promise::race([p])

  // from_async
  let _ = Promise::from_async(async fn() { 1 })
}

test "Explicit Output/Hash calls" {
  let buf = @buffer.new(size_hint=0)
  let h = Hasher::new()
  
  // Any output
  let a = Any::new(100)
  a.output(buf)
  inspect(buf.to_string(), content="100")
  buf.reset()

  // Undefined
  let u = Undefined::new()
  u.output(buf)
  inspect(buf.to_string(), content="undefined")
  buf.reset()
  u.hash_combine(h)

  // Null
  let n = Null::new()
  n.output(buf)
  inspect(buf.to_string(), content="null")
  buf.reset()
  n.hash_combine(h)

  // Symbol
  let s = Symbol::from_string_existing("sym_test")
  s.output(buf)
  inspect(buf.to_string(), content="Symbol(sym_test)")
  buf.reset()

  // Object
  let o = Object::new()
  o.output(buf)
  inspect(buf.to_string(), content="[object Object]")
  buf.reset()

  // Nullable
  let n_val : Nullable[Int] = Nullable::new(42)
  n_val.output(buf)
  inspect(buf.to_string(), content="42")
  buf.reset()
  n_val.hash_combine(h)

  let n_null : Nullable[Int] = Nullable::null()
  n_null.output(buf)
  inspect(buf.to_string(), content="null")
  buf.reset()
  n_null.hash_combine(h)

  // Nullish
  let nu_val : Nullish[Int] = Nullish::new(42)
  nu_val.output(buf)
  inspect(buf.to_string(), content="42")
  buf.reset()
  nu_val.hash_combine(h)

  let nu_undef : Nullish[Int] = Nullish::undefined()
  nu_undef.output(buf)
  inspect(buf.to_string(), content="undefined")
  buf.reset()
  nu_undef.hash_combine(h)

  let nu_null : Nullish[Int] = Nullish::null()
  nu_null.output(buf)
  inspect(buf.to_string(), content="null")
  buf.reset()
  nu_null.hash_combine(h)
}


suberror TestError { TestError(String) } derive(Show)

test "Promise::from_async failure" {
  let p : Promise[Int] = Promise::from_async(async fn() { 
    raise TestError("async error")
  })
  // We expect p to be rejected. 
  // To verify without crashing, we catch it.
  let _ = p.catch_(fn(_e) { 0 })
}
