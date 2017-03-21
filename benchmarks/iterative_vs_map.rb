require 'benchmark/ips'


puts <<-DOC

ITERATIVE vs. MAP

Building a new array with 1000 elements from another array of 1000 elements.

(1) Iterative:
    Building the new array explicitly and using Array#each with a block to
    assign the values to the array.

(2) Map:
    Using Array#map with a block.

DOC


ary = (1..1000).map { rand(100) }


Benchmark.ips do |bm|
  bm.report 'Iterative' do
    new_ary = []
    ary.each { |x| new_ary << x + 3 }
    new_ary
  end

  bm.report 'Map' do
    ary.map { |x| x + 3 }
  end
end
