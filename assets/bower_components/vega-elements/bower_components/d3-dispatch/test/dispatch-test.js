var tape = require("tape"),
    dispatch = require("../");

tape("dispatch(type…) returns a dispatch object with the specified types", function(test) {
  var d = dispatch.dispatch("foo", "bar");
  test.ok(d instanceof dispatch.dispatch);
  test.equal(typeof d.foo, "function");
  test.equal(typeof d.bar, "function");
  test.end();
});

tape("dispatch(type…) throws an error if a specified type name is illegal", function(test) {
  test.throws(function() { dispatch.dispatch("__proto__"); });
  test.throws(function() { dispatch.dispatch("hasOwnProperty"); });
  test.throws(function() { dispatch.dispatch("on"); });
  test.throws(function() { dispatch.dispatch(""); });
  test.end();
});

tape("dispatch(type…) throws an error if a specified type name is a duplicate", function(test) {
  test.throws(function() { dispatch.dispatch("foo", "foo"); });
  test.end();
});

tape("dispatch(type)[type](…) invokes callbacks of the specified type", function(test) {
  var foo = 0,
      bar = 0,
      d = dispatch.dispatch("foo", "bar").on("foo", function() { ++foo; }).on("bar", function() { ++bar; });
  d.foo();
  test.equal(foo, 1);
  test.equal(bar, 0);
  d.foo();
  d.bar();
  test.equal(foo, 2);
  test.equal(bar, 1);
  test.end();
});

tape("dispatch(type)[type](…) invokes callbacks with specified arguments and context", function(test) {
  var results = [],
      foo = {},
      bar = {},
      d = dispatch.dispatch("foo").on("foo", function() { results.push({this: this, arguments: [].slice.call(arguments)}); });
  d.foo.call(foo, bar);
  test.deepEqual(results, [{this: foo, arguments: [bar]}]);
  d.foo.call(bar, foo, 42, "baz");
  test.deepEqual(results, [{this: foo, arguments: [bar]}, {this: bar, arguments: [foo, 42, "baz"]}]);
  test.end();
});

tape("dispatch(type)[type](…) invokes callbacks in the order they were added", function(test) {
  var results = [],
      d = dispatch.dispatch("foo");
  d.on("foo.a", function() { results.push("A"); });
  d.on("foo.b", function() { results.push("B"); });
  d.foo();
  d.on("foo.c", function() { results.push("C"); });
  d.on("foo.a", function() { results.push("A"); }); // move to end
  d.foo();
  test.deepEqual(results, ["A", "B", "B", "C", "A"]);
  test.end();
});

tape("dispatch(type)[type](…) returns the dispatch object", function(test) {
  var d = dispatch.dispatch("foo");
  test.equal(d.foo(), d);
  test.end();
});

tape("dispatch(type).on(type, f) returns the dispatch object", function(test) {
  var d = dispatch.dispatch("foo");
  test.equal(d.on("foo", function() {}), d);
  test.end();
});

tape("dispatch(type).on(type, f) replaces an existing callback, if present", function(test) {
  var foo = 0,
      bar = 0,
      d = dispatch.dispatch("foo", "bar");
  d.on("foo", function() { ++foo; });
  d.foo();
  test.equal(foo, 1);
  test.equal(bar, 0);
  d.on("foo", function() { ++bar; });
  d.foo();
  test.equal(foo, 1);
  test.equal(bar, 1);
  test.end();
});

tape("dispatch(type).on(type, f) replacing an existing callback with itself has no effect", function(test) {
  var foo = 0,
      FOO = function() { ++foo; },
      d = dispatch.dispatch("foo").on("foo", FOO);
  d.foo();
  test.equal(foo, 1);
  d.on("foo", FOO).on("foo", FOO).on("foo", FOO);
  d.foo();
  test.equal(foo, 2);
  test.end();
});

tape("dispatch(type).on(type, null) removes an existing callback, if present", function(test) {
  var foo = 0,
      d = dispatch.dispatch("foo", "bar");
  d.on("foo", function() { ++foo; });
  d.foo();
  test.equal(foo, 1);
  d.on("foo", null);
  d.foo();
  test.equal(foo, 1);
  test.end();
});

tape("dispatch(type).on(type, null) does not remove a shared callback", function(test) {
  var a = 0,
      A = function() { ++a; },
      d = dispatch.dispatch("foo", "bar").on("foo", A).on("bar", A);
  d.foo();
  d.bar();
  test.equal(a, 2);
  d.on("foo", null);
  d.bar();
  test.equal(a, 3);
  test.end();
});

tape("dispatch(type).on(type, null) removing a missing callback has no effect", function(test) {
  var d = dispatch.dispatch("foo"), a = 0;
  function A() { ++a; }
  d.on("foo.a", null).on("foo", A).on("foo", null).on("foo", null);
  d.foo();
  test.equal(a, 0);
  test.end();
});

tape("dispatch(type).on(type, null) removing a callback does affect the current call", function(test) {
  var d = dispatch.dispatch("foo"), a = {}, b = {}, those = [];
  function A() { d.on("foo.b", null); those.push(a); }
  function B() { those.push(b); }
  d.on("foo.a", A).on("foo.b", B);
  d.foo();
  test.deepEqual(those, [a]);
  test.end();
});

tape("dispatch(type).on(type, f) adding a callback does not affect the current call", function(test) {
  var d = dispatch.dispatch("foo"), a = {}, b = {}, those = [];
  function A() { d.on("foo.b", B); those.push(a); }
  function B() { those.push(b); }
  d.on("foo.a", A);
  d.foo();
  test.deepEqual(those, [a]);
  test.end();
});

tape("dispatch(type).on(type, f) coerces type to a string", function(test) {
  var f = function() {},
      g = function() {},
      d = dispatch.dispatch(null, undefined).on(null, f).on(undefined, g);
  test.equal(d.on(null), f);
  test.equal(d.on(undefined), g);
  test.end();
});

tape("dispatch(…).on(type, f) throws an error if the type is unknown", function(test) {
  test.throws(function() { dispatch.dispatch("foo").on("bar", function() {}); }, /unknown type: bar/);
  test.throws(function() { dispatch.dispatch("foo").on("__proto__", function() {}); }, /unknown type: __proto__/);
  test.end();
});

tape("dispatch(…).on(type) throws an error if the type is unknown", function(test) {
  test.throws(function() { dispatch.dispatch("foo").on("bar"); }, /unknown type: bar/);
  test.throws(function() { dispatch.dispatch("foo").on("__proto__"); }, /unknown type: __proto__/);
  test.end();
});

tape("dispatch(type).on(type) returns the expected callback", function(test) {
  var d = dispatch.dispatch("foo");
  function A() {}
  function B() {}
  function C() {}
  d.on("foo.a", A).on("foo.b", B).on("foo", C);
  test.equal(d.on("foo.a"), A);
  test.equal(d.on("foo.b"), B);
  test.equal(d.on("foo"), C);
  test.end();
});

tape("dispatch(type).on(.name) returns undefined when retrieving a callback", function(test) {
  var d = dispatch.dispatch("foo").on("foo.a", function() {});
  test.equal(d.on(".a"), undefined);
  test.end();
});

tape("dispatch(type).on(.name, null) removes all callbacks with the specified name", function(test) {
  var d = dispatch.dispatch("foo", "bar"), a = {}, b = {}, c = {}, those = [];
  function A() { those.push(a); }
  function B() { those.push(b); }
  function C() { those.push(c); }
  d.on("foo.a", A).on("bar.a", B).on("foo", C).on(".a", null);
  d.foo();
  d.bar();
  test.deepEqual(those, [c]);
  test.end();
});

tape("dispatch(type).on(.name, f) has no effect", function(test) {
  var d = dispatch.dispatch("foo", "bar"), a = {}, b = {}, those = [];
  function A() { those.push(a); }
  function B() { those.push(b); }
  d.on(".a", A).on("foo.a", B).on("bar", B);
  d.foo();
  d.bar();
  test.deepEqual(those, [b, b]);
  test.equal(d.on(".a"), undefined);
  test.end();
});
