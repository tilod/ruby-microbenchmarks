require 'benchmark/ips'

puts <<-DOC

YIELD vs. CALL BLOCK

DOC


class WithYield
  def do_something
    yield 2 if block_given?
  end
end

class WithBlock
  def do_something(&block)
    block.call(2) if block
  end
end

Benchmark.ips do |bm|
  with_yield = WithYield.new
  with_block = WithBlock.new

  bm.report 'Using `yield`' do
    with_yield.do_something               # call w/o block
    with_yield.do_something do |value|    # call w/ block
      value + 3
    end
  end

  bm.report 'Using `block.call`' do
    with_block.do_something               # call w/o block
    with_block.do_something do |value|    # call w/ block
      value + 3
    end
  end
end
