//! Factory.mc
//!
//! Copyright Greg Caufield 2020

module MonkeyInject {
module Internal {

//!
//!
//!
(:background)
class Factory {
  private var resolutionRoot_;

  function initialize(resolutionRoot) {
    resolutionRoot_ = resolutionRoot;
  }

  function build() {
    return self;
  }

  function get(interface) {
    var resolutionRoot = resolutionRoot_.get();
    if( resolutionRoot == null ) {
      // TODO Exception
      return null;
    }

    return resolutionRoot.build(interface);
  }
}
}
}
