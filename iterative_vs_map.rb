require 'benchmark'

ary = (1..10_000_000).map { rand }

Benchmark.bm(40) do |bm|
  puts 'iterative vs. map'
  puts '-----------------'
  puts

  bm.report '    iterative:' do
    new_ary = []
    ary.each { |i| new_ary << rand + i }
  end

  bm.report '    map:' do
    (1..10_000_000).map { |i| rand + ary[i-1] }
  end
end