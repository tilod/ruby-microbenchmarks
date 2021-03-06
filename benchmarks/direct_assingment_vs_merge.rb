require 'benchmark/ips'


puts <<-DOC

DIRECT ASSIGNMENT vs. MERGE

Assigning values in a Hash by direct assignment (Hash#[]=) vs. Hash#merge and
Hash#merge!. Values are taken from another hash which is pre-build or newly
created when passed.

( 1) []=, no hash:
     Direct assignment, assigning 1000 elements, no hash where the values are
     copied from. It can't be faster than this.

( 2) []=, 1000x1, pre:
     Direct assignment, assigning 1000 elements, copying values from pre-build
     hash.

( 3) merge, 1000x1, pre:
     Hash#merge, merging 1000 hashes with 1 element each, using pre-build hash.

( 4) merge, 1000x1, new:
     Hash#merge, merging 1000 hashes with 1 element each, building new hash.

( 5) merge!, 1000x1, pre:
     Hash#merge!, merging 1000 hashes with 1 element each, using pre-build hash.

( 6) merge!, 1000x1, new:
     Hash#merge!, merging 1000 hashes with 1 element each, building new hash.

( 7) []=, 100x10, pre:
     Direct assignment, copying the values over from 100 pre-build hashes with
     10 elements each.

( 8) merge, 100x10, pre:
     Hash#merge, merging 100 hashes with 10 elements each, using pre-build hash.

( 9) merge, 100x10, new:
     Hash#merge, merging 100 hashes with 10 elements each, building a new hash.

(10) merge!, 100x10, pre:
     Hash#merge!, merging 100 hashes with 10 elements each, using pre-build
     hash.

(11) merge!, 100x10, new:
     Hash#merge!, merging 100 hashes with 10 elements each, building a new hash.

(12) []=, 10x100, pre:
     Direct assignment, copying the values over from 10 pre-build hashes with
     100 elements each.

(13) merge, 10x100, pre:
     Hash#merge, merging 10 hashes with 100 elements each, using pre-build hash.

(14) merge, 10x100, new:
     Hash#merge!, merging 10 hashes with 100 elements each, building a new hash.

DOC


def useless_hash(entries_count)
  Hash[(0..entries_count).map { |i| [i, 'useless'] }]
end

useless_hashes_1   = (1..1000).map { useless_hash(1) }
useless_hashes_10  = (1.. 100).map { useless_hash(10) }
useless_hashes_100 = (1..  10).map { useless_hash(100) }


Benchmark.ips do |bm|
  bm.report '[]=, no hash' do
    hash = {}
    1000.times do |i|
      hash[i] = 'useless'
    end
  end

  bm.report '[]=, 1000x1, pre' do
    hash = {}
    useless_hashes_1.each do |h|
      h.each do |k, v|
        hash[k] = v
      end
    end
  end

  bm.report 'merge, 1000x1, pre' do
    hash = {}
    useless_hashes_1.each do |h|
      hash = hash.merge(h)
    end
  end

  bm.report 'merge, 1000x1, new' do
    hash = {}
    1000.times do |i|
      hash = hash.merge(i => 'useless')
    end
  end

  bm.report 'merge!, 1000x1, pre' do
    hash = {}
    useless_hashes_1.each do |h|
      hash = hash.merge!(h)
    end
  end

  bm.report 'merge!, 1000x1, new' do
    hash = {}
    1000.times do |i|
      hash = hash.merge!(i => 'useless')
    end
  end

  bm.report '[]=, 100x10, pre' do
    hash = {}
    useless_hashes_10.each do |h|
      h.each do |k, v|
        hash[k] = v
      end
    end
  end

  bm.report 'merge, 100x10, pre' do
    hash = {}
    useless_hashes_10.each do |h|
      hash = hash.merge(h)
    end
  end

  bm.report 'merge, 100x10, new' do
    hash = {}
    100.times do |i|
      hash = hash.merge(i      => 'useless', i+1000 => 'useless',
                        i+2000 => 'useless', i+3000 => 'useless',
                        i+4000 => 'useless', i+5000 => 'useless',
                        i+6000 => 'useless', i+7000 => 'useless',
                        i+8000 => 'useless', i+9000 => 'useless')
    end
  end

  bm.report 'merge!, 100x10, pre' do
    hash = {}
    useless_hashes_10.each do |h|
      hash = hash.merge!(h)
    end
  end

  bm.report 'merge!, 100x10, new' do
    hash = {}
    100.times do |i|
      hash = hash.merge!(i      => 'useless', i+1000 => 'useless',
                         i+2000 => 'useless', i+3000 => 'useless',
                         i+4000 => 'useless', i+5000 => 'useless',
                         i+6000 => 'useless', i+7000 => 'useless',
                         i+8000 => 'useless', i+9000 => 'useless')
    end
  end

  bm.report '[]=, 10x100, pre' do
    hash = {}
    useless_hashes_100.each do |h|
      h.each do |k, v|
        hash[k] = v
      end
    end
  end

  bm.report 'merge, 10x100, pre' do
    hash = {}
    useless_hashes_100.each do |h|
      hash = hash.merge(h)
    end
  end

  bm.report 'merge, 10x100, new' do
    hash = {}
    useless_hashes_100.each do |h|
      hash = hash.merge!(h)
    end
  end
end
