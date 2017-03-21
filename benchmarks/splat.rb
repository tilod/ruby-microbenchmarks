require 'benchmark/ips'

puts <<-DOC

SPLAT

DOC


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
  class_with_splat              = ClassWithSplat.new
  class_with_explicit_arguments = ClassWithExplicitArguments.new

  bm.report 'Explicit arguments' do
    class_with_explicit_arguments.call(1, 2)
  end

  bm.report 'Splat' do
    class_with_splat.call(1, 2)
  end
end
