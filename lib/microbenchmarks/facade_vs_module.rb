require 'benchmark/ips'


puts %q[
facade pattern vs. module
=========================

direct call:
  Call method directly. It can't be faster then this.

call from method:
  Call method from other method in same class.

facade:
  Facade Pattern. Use Composition and call method from method in facade.
  Traditional object oriented approach.

concern:
  Concern as used in Rails. Include module in class and call method from mixed
  in method in module.

dci:
  Data, Context and Interaction. Extend an instance with a module and call
  method from the mixed in method in module.


]


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


module Facade
  class Example
    def do_something
      2 + 3
    end
  end

  class ExampleFacade
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
  bm.report 'direct call' do
    DirectCall::Example.new.do_something
  end

  bm.report 'call from method' do
    CallFromMethod::Example.new.call_do_something
  end

  bm.report 'facade' do
    Facade::ExampleFacade.new(Facade::Example.new).call_do_something
  end

  bm.report 'concern' do
    Concern::Example.new.call_do_something
  end

  bm.report 'dci' do
    DCI::Example.new.extend(DCI::ExampleDCIModule).call_do_something
  end
end