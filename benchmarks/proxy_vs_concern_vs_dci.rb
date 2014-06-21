require 'benchmark/ips'


puts %Q{
Proxy vs. Concern vs. DCI
=========================

Call methods in classes composed by using the proxy/decorator pattern,
module mixins (Concerns) or DCI.

direct call:
  Call method directly. It can't be faster than this.

call from method:
  Call method from other method in same class.

proxy:
  Proxy Pattern. Use Composition and call method from method in other object.
  Traditional object oriented approach.

concern:
  Concern as used in Rails. Include module in class and call method from mixed
  in method in module.

dci:
  Data, Context, Interaction. Extend an instance with a module and call
  method from the mixed in method in module.


}


module DirectCall
  class Example
    def do_something
      2 + 3
    end
  end
end


module CallFromMethod
  class Example
    def do_something
      2 + 3
    end

    def call_do_something
      do_something
    end
  end
end


module Proxy
  class Example
    def do_something
      2 + 3
    end
  end

  class ExampleProxy
    def initialize(base)
      @base = base
    end

    def call_do_something
      @base.do_something
    end
  end
end


module Concern
  module ExampleConcern
    def call_do_something
      do_something
    end
  end

  class Example
    include ExampleConcern

    def do_something
      2 + 3
    end
  end
end


module DCI
  class Example
    def do_something
      2 + 3
    end
  end

  module ExampleDCIModule
    def call_do_something
      do_something
    end
  end
end


Benchmark.ips do |bm|
  bm.report "direct call" do
    DirectCall::Example.new.do_something
  end

  bm.report "call from method" do
    CallFromMethod::Example.new.call_do_something
  end

  bm.report "proxy" do
    Proxy::ExampleProxy.new(Proxy::Example.new).call_do_something
  end

  bm.report "concern" do
    Concern::Example.new.call_do_something
  end

  bm.report "dci" do
    DCI::Example.new.extend(DCI::ExampleDCIModule).call_do_something
  end
end
