require 'benchmark'

Benchmark.bm(40) do |bm|
  ary = (1..10_000_000).map { rand }

  puts 'jit cleverness (simple function call)'
  puts '-------------------------------------'
  puts

  bm.report '    called every time (simple):' do
    sum = 0
    ary.each do |x|
      sum += ary.size
    end
    sum
  end

  bm.report '    called before loop (simple):' do
    sum = 0
    ary_size = ary.size
    ary.each do |x|
      sum += ary_size
    end
    sum
  end

  ary = (1..10_000).map { rand }

  bm.report '    called every time (complex):' do
    sum = 0
    ary.each do |x|
      sum += ary.inject(&:+)
    end
    sum
  end

  bm.report '    called before loop (complex):' do
    sum = 0
    ary_sum = ary.inject(&:+)
    ary.each do |x|
      sum += ary_sum
    end
    sum
  end

end