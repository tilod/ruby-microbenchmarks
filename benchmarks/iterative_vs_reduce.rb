require 'benchmark/ips'


puts <<-DOC

ITERATIVE vs. REDUCE

Summing up an array of 1000 integers.

(1) Iterative:
    Using Array#each with +=

(2) Reduce (with block):
    Using Array#reduce, passing a block with +

(3) Reduce (&:+):
    Using Array#reduce with +-method as proc

DOC


random_ary = (1..1000).map { rand(100) }

Benchmark.ips do |bm|
  bm.report 'Iterative' do
    sum = 0
    random_ary.each { |x| sum += x }
    sum
  end

  bm.report 'Reduce (with block)' do
    random_ary.reduce(0) { |sum, x| sum + x }
  end

  bm.report 'Reduce (&:+)' do
    random_ary.reduce(&:+)
  end
end
