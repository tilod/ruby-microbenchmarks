require 'benchmark'

random_ary = (1..1_000_000).map { rand(100) }

Benchmark.bm(40) do |bm|
  puts 'array include vs. boolean or'
  puts '----------------------------'
  puts

  bm.report '    boolean or (4 parts):' do
    random_ary.each do |r|
      if r == 1 || r == 3 || r == 5 || r == 7
        r * 2
      else
        r * 3
      end
    end
  end

  bm.report '    boolean or (10 parts):' do
    random_ary.each do |r|
      if r == 1 || r == 3 || r == 5 || r == 7 || r == 9 || r == 11 || r == 13 || r == 15 || r == 17 || r == 19
        r * 2
      else
        r * 3
      end
    end
  end

  bm.report '    boolean or (25 parts):' do
    random_ary.each do |r|
      if r == 1 || r == 3 || r == 5 || r == 7 || r == 9 ||
         r == 11 || r == 13 || r == 15 || r == 17 || r == 19 ||
         r == 21 || r == 23 || r == 25 || r == 27 || r == 29 ||
         r == 31 || r == 33 || r == 35 || r == 37 || r == 39 ||
         r == 41 || r == 43 || r == 45 || r == 47 || r == 49
        r * 2
      else
        r * 3
      end
    end
  end

  bm.report '    array.include? (4 parts):' do
    random_ary.each do |r|
      if [1, 3, 5, 7].include?(r)
        r * 2
      else
        r * 3
      end
    end
  end

  bm.report '    array.include? (10 parts):' do
    random_ary.each do |r|
      if [1, 3, 5, 7, 9, 11, 13, 15, 17, 19].include?(r)
        r * 2
      else
        r * 3
      end
    end
  end

  bm.report '    array.include? (25 parts):' do
    random_ary.each do |r|
      if [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31, 33, 35, 37, 39, 41, 43, 45, 47, 49].include?(r)
        r * 2
      else
        r * 3
      end
    end
  end

end