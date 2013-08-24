require 'benchmark/ips'


puts %q{
Iterative vs. Map
=================

Building a new array with 1000 elements from another array of 1000 elements.

iterative:
  Building the new array explicitly and using Array#each with a block to assign
  the values to the array.

map:
  Using Array#map with a block.


}


ary = (1..1000).map { rand(100) }


Benchmark.ips do |bm|
  bm.report 'iterative' do
    new_ary = []
    ary.each { |x| new_ary << x + 3 }
    new_ary
  end

  bm.report 'map' do
    ary.map { |x| x + 3 }
  end
end
