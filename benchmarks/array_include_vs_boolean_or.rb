require 'benchmark/ips'


puts %{
Array#include? vs. || (boolean OR)
==================================

boolean OR (4):
  boolean OR with 4 elements

boolean OR (10):
  boolean OR with 10 elements

boolean OR (25):
  boolean OR with 25 elements

Array#include? (4):
  Array#include? with 4 elements

Array#include? (10):
  Array#include? with 10 elements

Array#include? (25):
  Array#include? with 25 elements


}


random_ary = (1..1000).map { rand(100) }


Benchmark.ips do |bm|
  bm.report 'boolean OR  (4)' do
    random_ary.each do |r|
      if r == 1 || r == 3 || r == 5 || r == 7
        r * 2
      else
        r * 3
      end
    end
  end
    
  bm.report 'boolean OR (10)' do
    random_ary.each do |r|
      if r ==  1 || r ==  3 || r ==  5 || r ==  7 || r ==  9 ||
         r == 11 || r == 13 || r == 15 || r == 17 || r == 19
        r * 2
      else
        r * 3
      end
    end
  end

  bm.report 'boolean OR (25)' do
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

  bm.report 'Array#include?  (4)' do
    random_ary.each do |r|
      if [1, 3, 5, 7].include?(r)
        r * 2
      else
        r * 3
      end
    end
  end

  bm.report 'Array#include? (10)' do
    random_ary.each do |r|
      if [1, 3, 5, 7, 9, 11, 13, 15, 17, 19].include?(r)
        r * 2
      else
        r * 3
      end
    end
  end

  bm.report 'Array#include? (25)' do
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
