require 'benchmark/ips'


puts <<-DOC

ITERATIVE vs. MAP-REDUCE

Summing up the sub arrays of an array.

(1) Iterative:
    Using Array#each for summing and assigning.

(2) Map-reduce:
    Using Array#reduce to sum up the sub arrays and Array#map to assign the sums
    to the array.

DOC


ary = (1..100).map { (1..100).map { rand(100) } }


Benchmark.ips do |bm|
  bm.report 'Iterative' do
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

  bm.report 'Map-reduce' do
    ary.map { |sub_ary| sub_ary.reduce(&:+) }
  end
end
