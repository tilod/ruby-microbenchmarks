require 'benchmark/ips'


puts %q{
Iterative vs. Reduce
====================

Summing up an array of 1000 integers.

iterative:
  Using Array#each with +=

reduce (with block):
  Using Array#reduce, passing a block with +

reduce (&:+):
  Using Array#reduce with +-method as proc


}

random_ary = (1..1000).map { rand(100) }

Benchmark.ips do |bm|
  bm.report 'iterative' do
    sum = 0
    random_ary.each { |x| sum += x }
    sum
  end

  bm.report 'reduce (with block)' do
    random_ary.reduce(0) { |sum, x| sum + x }
  end

  bm.report 'reduce (&:+)' do
    random_ary.reduce(&:+)
  end
end
