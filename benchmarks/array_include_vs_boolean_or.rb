require 'benchmark/ips'


puts <<-DOC

ARRAY INCLUDE vs. BOOLEAN OR

When checking for multiple conditions, use `Array#include?` or chain boolean
or operators `||`.

(1) || w/ 4:
    Boolean OR with 4 elements.

(2) || w/ 10:
    Boolean OR with 10 elements.

(3) || w/ 25:
    Boolean OR with 25 elements.

(4) #include? w/ 4:
    Array#include? with 4 elements.

(5) #include? w/ 10:
    Array#include? with 10 elements.

(6) #include? w/ 25:
    Array#include? with 25 elements.

DOC


random_ary = (1..1000).map { rand(100) }


Benchmark.ips do |bm|
  bm.report '||  w/ 4' do
    random_ary.each do |r|
      if r == 1 || r == 3 || r == 5 || r == 7
        r * 2
      else
        r * 3
      end
    end
  end

  bm.report '|| w/ 10' do
    random_ary.each do |r|
      if r ==  1 || r ==  3 || r ==  5 || r ==  7 || r ==  9 ||
         r == 11 || r == 13 || r == 15 || r == 17 || r == 19
        r * 2
      else
        r * 3
      end
    end
  end

  bm.report '|| w/ 25' do
    random_ary.each do |r|
      if r ==  1 || r ==  3 || r ==  5 || r ==  7 || r ==  9 ||
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

  bm.report '#include?  w/ 4' do
    random_ary.each do |r|
      if [1, 3, 5, 7].include?(r)
        r * 2
      else
        r * 3
      end
    end
  end

  bm.report '#include? w/ 10' do
    random_ary.each do |r|
      if [1, 3, 5, 7, 9, 11, 13, 15, 17, 19].include?(r)
        r * 2
      else
        r * 3
      end
    end
  end

  bm.report '#include? w/ 25' do
    random_ary.each do |r|
      if [ 1,  3,  5,  7,  9, 11, 13, 15, 17, 19, 21, 23, 25,
          27, 29, 31, 33, 35, 37, 39, 41, 43, 45, 47, 49].include?(r)
        r * 2
      else
        r * 3
      end
    end
  end
end
