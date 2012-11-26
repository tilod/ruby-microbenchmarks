require 'benchmark'

random_ary = (1..10_000_000).map { rand }

Benchmark.bm(40) do |bm|
  puts 'iterative vs. inject'
  puts '--------------------'
  puts

  bm.report '    iterative:' do
    sum = 0
    random_ary.each do |x|
      sum += x
    end
    sum
  end

  bm.report '    inject (with block):' do
    random_ary.inject(0) do |sum, x|
      sum + x
    end
  end

  bm.report '    inject (functional):' do
    random_ary.inject(&:+)
  end
end