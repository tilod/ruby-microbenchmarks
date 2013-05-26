require 'benchmark'


class Base
  def do_something
    2 + 3
  end

  def call_do_something
    do_something
  end
end


class Facade
  def initialize(base)
    @base = base
  end

  def call_do_something
    @base.do_something
  end
end


module ModuleForExtension
  def call_do_something
    do_something
  end
end



Benchmark.bm(40) do |bm|
  puts 'facade pattern vs. module'
  puts '-----------------------------'
  puts

  bm.report '    direct call:' do
    1_000_000.times do
      Base.new.call_do_something
    end
  end

  bm.report '    facade ("classic" OO):' do
    1_000_000.times do
      Facade.new(Base.new).call_do_something
    end
  end

  bm.report '    include module in class (Concerns):' do
    Base.class_eval { include ModuleForExtension }

    1_000_000.times do
      Base.new.call_do_something
    end
  end

  bm.report '    extend module from instance (DCI):' do
    1_000_000.times do
      Base.new.extend(ModuleForExtension).call_do_something
    end
  end

  puts "\n\n"
end