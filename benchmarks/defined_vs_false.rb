require "benchmark/ips"

puts <<-DOC

DEFINED? vs. ASSIGNING FALSE

When memoizing a method which might return nil, use `defined?` or check for
`nil?` and assign a non-nil value.

DOC

class DefinedTest
  def memoized_method
    return @memoized if defined? @memoized

    @memoized = false
  end
end

class NilTest
  def memoized_method
    return @memoized unless @memoized.nil?

    @memoized = false
  end
end

Benchmark.ips do |bm|
  bm.report "defined?" do
    instance = DefinedTest.new
    instance.memoized_method
    instance.memoized_method
  end

  bm.report "nil?" do
    instance = NilTest.new
    instance.memoized_method
    instance.memoized_method
  end
end
