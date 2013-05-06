require 'benchmark'

Benchmark.bm(40) do |bm|
  puts 'string concat vs. inline eval'
  puts '-----------------------------'
  puts

  bm.report '    concat:' do
    1000000.times do
      string = 'first'  + (1 + 1).to_s +
               'second' + (2 + 2).to_s +
               'third'  + (3 + 3).to_s +
               'fourth' + (4 + 4).to_s +
               'fifth'  + (5 + 5).to_s
    end
  end

  bm.report '    append:' do
    1000000.times do
      string  = 'first'
      string << 1 + 1
      string << 'second' 
      string << 2 + 2
      string << 'third'  
      string << 3 + 3
      string << 'fourth' 
      string << 4 + 4
      string << 'fifth'  
      string << 5 + 5
    end
  end

  bm.report '    inline eval:' do
    1000000.times do
      string = "first#{1 + 1}second#{2 + 2}third#{3 + 3}fourth#{4 + 4}fifth#{5 + 5}"
    end
  end

  puts "\n\n"
end