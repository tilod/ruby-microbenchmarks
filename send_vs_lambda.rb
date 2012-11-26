require 'benchmark'

random_ary = (1..10_000_000).map { rand }
class UselessClass
  attr_reader :useless_lambda
  def initialize
    @useless_lambda = ->(random) { random * 2 }
  end

  def useless_method(random)
    random * 2
  end
  
  define_method 'useless_generated_method' do |random|
    random * 2
  end
end
useless_instance = UselessClass.new

Benchmark.bm(40) do |bm|
  puts 'send vs. lambda'
  puts '---------------'
  puts

  bm.report '    direct method call:' do
    random_ary.size.times do |i|
      useless_instance.useless_method(random_ary[i])
    end
  end

  bm.report '    send (def):' do
    random_ary.size.times do |i|
      useless_instance.send('useless_method', random_ary[i])
    end
  end

  bm.report '    send (define_method):' do
    random_ary.size.times do |i|
      useless_instance.send('useless_generated_method', random_ary[i])
    end
  end

  bm.report '    lambda:' do
    random_ary.size.times do |i|
      useless_instance.useless_lambda.call(random_ary[i])
    end
  end
end