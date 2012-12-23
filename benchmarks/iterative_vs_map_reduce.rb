require 'benchmark'

ary = (1..100).map { (1..100).map { rand } }

Benchmark.bm(40) do |bm|
  puts 'iterative vs. map-reduce'
  puts '------------------------'
  puts

  bm.report '    iterative:' do
    1000.times do
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
  end

  bm.report '    map-reduce:' do
    1000.times do
      ary.map do |sub_ary|
        sub_ary.reduce(&:+)
      end
    end
  end

  puts "\n\n"

end