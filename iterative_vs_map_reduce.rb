require 'benchmark'

ary = (1..10000).map { (1..1000).map { rand } }

Benchmark.bm(40) do |bm|
  puts 'iterative vs. map-reduce'
  puts '------------------------'
  puts

  bm.report '    iterative:' do
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

  bm.report '    map-reduce:' do
    ary.map do |sub_ary|
      sub_ary.reduce(&:+)
    end
  end

end