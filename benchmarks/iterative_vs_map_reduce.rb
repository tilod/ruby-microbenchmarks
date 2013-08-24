require 'benchmark/ips'


puts %q{
Iterative vs. Map-Reduce
========================

Summing up the sub arrays of an array.

iterative:
  Using Array#each for summing and assigning.

map-reduce:
  Using Array#reduce to sum up the sub arrays and Array#map to assign the sums
  to the array.


}


ary = (1..100).map { (1..100).map { rand(100) } }


Benchmark.ips do |bm|
  bm.report 'iterative' do
    result_ary = []
    ary.each do |sub_ary|
      sum = 0
      sub_ary.each do |x|
        sum += x
      end
      result_ary << sum
    end
    result_ary
  end

  bm.report 'map-reduce' do
    ary.map { |sub_ary| sub_ary.reduce(&:+) }
  end
end
