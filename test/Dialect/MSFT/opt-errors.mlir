// RUN: circt-opt %s -verify-diagnostics -split-input-file

hw.module.extern @Foo()

hw.module @Top() {
  // expected-error @+1 {{Unknown device type 'WACKY'}}
  hw.instance "foo1" @Foo() {"loc:" = #msft.physloc<WACKY, 0, 0, 0> } : () -> ()
}

// -----

module {
  // expected-error @+1 {{Unexpected msft attribute 'foo'}}
  hw.instance "foo1" @Foo() {"loc:" = #msft.foo<""> } : () -> ()
}
