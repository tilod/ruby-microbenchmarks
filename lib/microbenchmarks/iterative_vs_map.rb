require 'benchmark'

ary = (1..1000).map { rand }

Benchmark.bm(40) do |bm|
  puts 'iterative vs. map'
  puts '-----------------'
  puts

  bm.report '    iterative:' do
    10000.times do
      new_ary = []
      ary.each { |i| new_ary << i + ary[i-1] }
    end
  end

  bm.report '    map:' do
    10000.times do
      (1..1000).map { |i| i + ary[i-1] }
    end
  end

  puts "\n\n"
end