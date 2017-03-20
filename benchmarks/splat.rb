require 'benchmark/ips'

class ClassWithSplat
  def call(*args)
    add(*args)
  end

  def add(first, second)
    first + second
  end
end

class ClassWithExplicitArguments
  def call(first, second)
    add(first, second)
  end

  def add(first, second)
    first + second
  end
end

Benchmark.ips do |bm|
  classWithSplat             = ClassWithSplat.new
  classWithExplicitArguments = ClassWithExplicitArguments.new

  bm.report 'using splat' do
    classWithSplat.(1, 2)
  end

  bm.report 'explicit arguments' do
    classWithExplicitArguments.(1, 2)
  end
end
