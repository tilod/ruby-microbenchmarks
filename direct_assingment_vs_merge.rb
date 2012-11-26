require 'benchmark'

random_ary = (1..1000).map { rand(1..100) }

Benchmark.bm(40) do |bm|

  puts 'Hash: direct assignment vs. merge'
  puts '---------------------------------'
  puts

  bm.report '    direkt assignment (10 entries):' do
    100_000.times do
      hash = {}
      10.times do |i|
        hash[i] = random_ary[i]
      end
    end
  end

  bm.report '    merge (10 entries):' do
    100_000.times do
      hash = {}
      10.times do |i|
        hash = hash.merge(i => random_ary[i])
      end
    end
  end

  bm.report '    merge! (10 entries):' do
    100_000.times do
      hash = {}
      10.times do |i|
        hash.merge!(i => random_ary[i])
      end
    end
  end

  bm.report '    direkt assignment (100 entries):' do
    10_000.times do
      hash = {}
      100.times do |i|
        hash[i] = random_ary[i]
      end
    end
  end

  bm.report '    merge (100 entries):' do
    10_000.times do
      hash = {}
      100.times do |i|
        hash = hash.merge(i => random_ary[i])
      end
    end
  end

  bm.report '    merge! (100 entries):' do
    10_000.times do
      hash = {}
      100.times do |i|
        hash.merge!(i => random_ary[i])
      end
    end
  end

  bm.report '    direkt assignment (1000 entries):' do
    1000.times do
      hash = {}
      1000.times do |i|
        hash[i] = random_ary[i]
      end
    end
  end

  bm.report 'merge (1000 entries):' do
    1000.times do
      hash = {}
      1000.times do |i|
        hash = hash.merge(i => random_ary[i])
      end
    end
  end

  bm.report '    merge! (1000 entries):' do
    1000.times do
      hash = {}
      1000.times do |i|
        hash.merge!(i => random_ary[i])
      end
    end
  end

end
