require 'benchmark'

random_ary = (1..1000).map { rand }
class UselessClass
  attr_reader :useless_lambda
  def initialize
    @useless_lambda = lambda { |random| random * 2 }
  end

  def useless_method(random)
    random * 2
  end
  
  define_method 'useless_generated_method' do |random|
    random * 2
  end

  def method_missing(method, *args, &block)
    if method == :useless_missing_method
      args[0] * 2
    else
      super
    end
  end
end
useless_instance = UselessClass.new

Benchmark.bm(40) do |bm|
  puts 'send vs. lambda vs. method_missing'
  puts '----------------------------------'
  puts

  bm.report '    direct method call (def):' do
    10000.times do
      random_ary.size.times do |i|
        useless_instance.useless_method(random_ary[i])
      end
    end
  end

  bm.report '    direct method call (define_method):' do
    10000.times do
      random_ary.size.times do |i|
        useless_instance.useless_generated_method(random_ary[i])
      end
    end
  end

  bm.report '    send (def):' do
    10000.times do
      random_ary.size.times do |i|
        useless_instance.send('useless_method', random_ary[i])
      end
    end
  end

  bm.report '    send (define_method):' do
    10000.times do
      random_ary.size.times do |i|
        useless_instance.send('useless_generated_method', random_ary[i])
      end
    end
  end

  bm.report '    lambda:' do
    10000.times do
      random_ary.size.times do |i|
        useless_instance.useless_lambda.call(random_ary[i])
      end
    end
  end

  bm.report '    method_missing:' do
    10000.times do
      random_ary.size.times do |i|
        useless_instance.useless_missing_method(random_ary[i])
      end
    end
  end

  puts "\n\n"
end