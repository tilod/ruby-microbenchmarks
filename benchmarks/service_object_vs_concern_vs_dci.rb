require 'benchmark/ips'


puts <<-DOC

SERVICE OBJECT vs. CONCERN vs. DCI

Call methods in classes composed by using the proxy/decorator pattern,
module mixins (Concerns) or DCI.

(1) Direct call:
    Call method directly. It can't be faster than this.

(2) Call from method:
    Call method from other method in same class.

(3) Service Object:
    Use Composition and call method from method in other object. Traditional
    object oriented approach.

(4) Concern:
    Concern as used in Rails. Include module in class and call method from mixed
    in method in module.

(5) DCI:
    Data, Context, Interaction. Extend an instance with a module and call
    method from the mixed in method in module.

DOC


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
  bm.report 'Direct call' do
    DirectCall::Example.new.do_something
  end

  bm.report 'Call from method' do
    CallFromMethod::Example.new.call_do_something
  end

  bm.report 'Service Object' do
    Proxy::ExampleProxy.new(Proxy::Example.new).call_do_something
  end

  bm.report 'Concern' do
    Concern::Example.new.call_do_something
  end

  bm.report 'DCI' do
    DCI::Example.new.extend(DCI::ExampleDCIModule).call_do_something
  end
end
