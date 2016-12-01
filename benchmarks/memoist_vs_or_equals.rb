require 'benchmark/ips'
require 'memoist'

class WithMemoist
  extend Memoist

  memoize def a
    1 + 1
  end

  memoize def b
    2 + 2
  end

  memoize def c
    3 + 3
  end
end

class WithoutMemoist
  def a
    @a ||= 1 + 1
  end

  def b
    @b ||= 2 + 2
  end

  def c
    @c ||= 3 + 3
  end
end

Benchmark.ips do |bm|
  bm.report 'with memoist    ( 1 call )' do
    instance = WithMemoist.new
    instance.a
    instance.b
    instance.c
  end

  bm.report 'with memoist    ( 3 calls)' do
    instance = WithMemoist.new
    3.times do
      instance.a
      instance.b
      instance.c
    end
  end

  bm.report 'with memoist    (10 calls)' do
    instance = WithMemoist.new
    10.times do
      instance.a
      instance.b
      instance.c
    end
  end

  bm.report 'without memoist ( 1 call )' do
    instance = WithoutMemoist.new
    instance.a
    instance.b
    instance.c
  end

  bm.report 'without memoist ( 3 calls)' do
    instance = WithoutMemoist.new
    3.times do
      instance.a
      instance.b
      instance.c
    end
  end

  bm.report 'without memoist (10 calls)' do
    instance = WithoutMemoist.new
    10.times do
      instance.a
      instance.b
      instance.c
    end
  end
end
