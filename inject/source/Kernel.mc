// Kernel.mc
//
// Copyright Greg Caufield 2020

import Toybox.Lang;

module MonkeyInject {

//!
//!
//!
(:background)
class Kernel {
  private var bindings_ as Dictionary;

  function initialize() {
    bindings_ = {};
  }

  function load(mod as Module) {
    mod.getBindings(self.weak(), bindings_);
  }

  function build(intf) as Object {
    if(bindings_[intf] != null) {
      return bindings_[intf].build();
    }

    throw new InjectionException(
        "No binding for interface: " + intf);
  }
}
}
