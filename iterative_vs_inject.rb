require 'benchmark'

random_ary = (1..1000).map { rand }

Benchmark.bm(40) do |bm|
  puts 'iterative vs. inject'
  puts '--------------------'
  puts

  bm.report '    iterative:' do
    10000.times do
      sum = 0
      random_ary.each do |x|
        sum += x
      end
      sum
    end
  end

  bm.report '    inject (with block):' do
    10000.times do
      random_ary.inject(0) do |sum, x|
        sum + x
      end
    end
  end

  bm.report '    inject (&:+):' do
    10000.times do
      random_ary.inject(&:+)
    end
  end

  puts "\n\n"
end