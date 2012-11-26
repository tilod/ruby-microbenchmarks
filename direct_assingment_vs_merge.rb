require 'benchmark'

random_ary = (1..1000).map { rand(1..100) }

@offset = 0
def useless_hash(entries)
  hash = Hash[(@offset..@offset + entries).map { |i| [i, rand(1..100)] }]
  @offset += entries

  hash
end


Benchmark.bm(40) do |bm|

  puts 'Hash: direct assignment vs. merge'
  puts '---------------------------------'
  puts

  bm.report '    direct assignment (1000x1):' do
    1000.times do
      hash = {}
      1000.times do |i|
        hash[i] = random_ary[i]
      end
    end
  end

  bm.report '    merge! (1000x1):' do
    1000.times do
      hash = {}
      1000.times do |i|
        hash.merge!(i => random_ary[i])
      end
    end
  end

  bm.report '    merge (1000x1):' do
    1000.times do
      hash = {}
      1000.times do |i|
        hash = hash.merge(i => random_ary[i])
      end
    end
  end

  hashes = (1..100).map{useless_hash(10)}
  
  bm.report '    direct assignment (100x10):' do
    1000.times do
      hash = {}
      hashes.each do |h|
        h.each do |k, v|
          hash[k] = v
        end
      end
    end
  end

  bm.report '    merge! (100x10):' do
    1000.times do
      hash = {}
      hashes.each do |h|
        hash.merge!(h)
      end
    end
  end

  bm.report '    merge (100x10):' do
    1000.times do
      hash = {}
      hashes.each do |h|
        hash = hash.merge(h)
      end
    end
  end

  hashes = (1..10).map{useless_hash(100)}

  bm.report '    direct assignment (10x100):' do
    1000.times do
      hash = {}
      hashes.each do |h|
        h.each do |k, v|
          hash[k] = v
        end
      end
    end
  end

  bm.report '    merge! (10x100):' do
    1000.times do
      hash = {}
      hashes.each do |h|
        hash.merge!(h)
      end
    end
  end

  bm.report '    merge (10x100):' do
    1000.times do
      hash = {}
      hashes.each do |h|
        hash = hash.merge(h)
      end
    end
  end

end
