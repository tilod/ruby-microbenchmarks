require 'benchmark/ips'

puts <<-DOC

KEYWORDS ARGUMENTS

(1) No KW args:
    Defining the method without keyword arguments.

(2) KW args (defaults):
    Defining the method with keyword arguments and defaults, using the default
    values when calling the method.

(3) KW args (w/ values):
    Defining the method with keyword arguments and defaults, pass values when
    calling the method.

(4) KW splat:
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
  without_keyword_args = WithoutKeywordArgs.new
  with_keyword_args    = WithKeywordArgs.new
  with_keyword_splat   = WithKeywordSplat.new

  bm.report 'No KW args' do
    without_keyword_args.call(1, 2, 3)
  end

  bm.report 'KW args (defaults)' do
    with_keyword_args.call(1)
  end

  bm.report 'KW args (w/ values)' do
    with_keyword_args.call(1, two: 2, three: 3)
  end

  bm.report 'KW splat' do
    with_keyword_splat.call(1, two: 2, three: 3)
  end
end

GC.enable
