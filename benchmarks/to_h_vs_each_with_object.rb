require 'benchmark/ips'

Benchmark.ips do |bm|
  bm.report 'to_h' do
    [*1..100].to_h { |x| [x.to_s, x] }
  end

  bm.report 'each_with_object' do
    [*1..100].each_with_object({}) { |x, h| h[x.to_s] = x }
  end
end
