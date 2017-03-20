require 'benchmark/ips'

puts <<-DOC

KEYWORDS ARGUMENTS

(1) no kw args:
  Defining the method without keyword arguments.

(2) kw args I:
  Defining the method with keyword arguments and defaults, using the default
  values when calling the method.

(3) kw args II:
  Defining the method with keyword arguments and defaults, pass values when
  calling the method.

(4) kw splat:
  Defining the method with a keyword splat (`**opts`).


DOC


class WithoutKeywordArgs
  def call(one, two, three)
    one + two + three
  end
end

class WithKeywordArgs
  def call(one, two: 2, three: 3)
    one + two + three
  end
end

class WithKeywordSplat
  def call(one, **opts)
    one + opts[:two] + opts[:three]
  end
end

# Turn off GC because we reach > 10M iterations per second -> GC has a huge
# impact on this
GC.disable

Benchmark.ips do |bm|
  withoutKeywordArgs = WithoutKeywordArgs.new
  withKeywordArgs    = WithKeywordArgs.new
  withKeywordSplat   = WithKeywordSplat.new

  bm.report '(1) no kw args' do
    withoutKeywordArgs.(1, 2, 3)
  end

  bm.report '(2) kw args I ' do
    withKeywordArgs.(1)
  end

  bm.report '(3) kw args II' do
    withKeywordArgs.(1, two: 2, three: 3)
  end

  bm.report '(4) kw splat  ' do
    withKeywordSplat.(1, two: 2, three: 3)
  end
end

GC.enable
