require 'benchmark/ips'
require 'memoist'

puts <<~DOC
  MEMOIST vs. OR-EQUALS vs. DEFINED?

DOC

class WithMemoist
  extend Memoist

  memoize def aaa
    1 + 1
  end

  memoize def bbb
    2 + 2
  end

  memoize def ccc
    3 + 3
  end
end

class WithOrEquals
  def aaa
    @aaa ||= 1 + 1
  end

  def bbb
    @bbb ||= 2 + 2
  end

  def ccc
    @ccc ||= 3 + 3
  end
end

class WithDefined
  def aaa
    defined?(@aaa) ? @aaa : @aaa = 1 + 1
  end

  def bbb
    defined?(@bbb) ? @bbb : @bbb = 2 + 2
  end

  def ccc
    defined?(@ccc) ? @ccc : @ccc = 3 + 3
  end
end

Benchmark.ips do |bm|
  bm.report 'memoist     (1 call)' do
    instance = WithMemoist.new
    instance.aaa
    instance.bbb
    instance.ccc
  end

  bm.report 'memoist    (3 calls)' do
    instance = WithMemoist.new
    3.times do
      instance.aaa
      instance.bbb
      instance.ccc
    end
  end

  bm.report 'memoist   (10 calls)' do
    instance = WithMemoist.new
    10.times do
      instance.aaa
      instance.bbb
      instance.ccc
    end
  end

  bm.report 'or-equals   (1 call)' do
    instance = WithOrEquals.new
    instance.aaa
    instance.bbb
    instance.ccc
  end

  bm.report 'or-equals  (3 calls)' do
    instance = WithOrEquals.new
    3.times do
      instance.aaa
      instance.bbb
      instance.ccc
    end
  end

  bm.report 'or-equals (10 calls)' do
    instance = WithOrEquals.new
    10.times do
      instance.aaa
      instance.bbb
      instance.ccc
    end
  end

  bm.report 'defined?    (1 call)' do
    instance = WithDefined.new
    instance.aaa
    instance.bbb
    instance.ccc
  end

  bm.report 'defined?   (3 calls)' do
    instance = WithDefined.new
    3.times do
      instance.aaa
      instance.bbb
      instance.ccc
    end
  end

  bm.report 'defined?  (10 calls)' do
    instance = WithDefined.new
    10.times do
      instance.aaa
      instance.bbb
      instance.ccc
    end
  end
end
