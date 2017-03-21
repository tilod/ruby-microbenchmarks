require 'benchmark/ips'

puts <<-DOC

SEND vs. LAMBDA vs. METHOD_MISSING

Calling methods in a class.

(1) def, directly called:
    Method defined with def keyword, called directly. It can't be any faster
    than this.

(2) #define_method, directly called:
    Method defined with Module#define_method, called directly.

(3) def, called with #send, string used:
    Method defined with def keyword, called using Kernel#send, passing a string
    to send.

(4) def, called with #send, symbol used:
    Method defined with def keyword, called using Kernel#send, passing a symbol
    to send.

(5) #define_method, called with #send, string used:
    Method defined with Module#define_method, called using Kernel#send, passing
    a string to send.

(6) #define_method, called with #send, symbol used:
    Method defined with Module#define_method, called using Kernel#send, passing
    a symbol to send.

(7) defined as lambda, called directly:
    Method returns a lambda which is executed with #call

(8) defined as lambda, called with instance_exec:
    Method calls the lambda with instance_exec.

(9) no method defined, method_missing called:
    Calling a missing method, functionality is implemented in method_missing

DOC


class UselessClass
  attr_reader :useless_lambda
  def initialize
    @useless_lambda = ->(number) { number * 2 }
  end

  def useless_method(number)
    number * 2
  end

  define_method :useless_generated_method do |number|
    number * 2
  end

  def method_missing(method, *args, &block)
    if method == :useless_missing_method
      args.first * 2
    else
      super
    end
  end

  def respond_to_missing?(method, include_private = false)
    method == :useless_missing_method
  end
end
useless_instance = UselessClass.new

Benchmark.ips do |bm|
  bm.report '(1)' do
    useless_instance.useless_method(3)
  end

  bm.report '(2)' do
    useless_instance.useless_generated_method(3)
  end

  bm.report '(3)' do
    useless_instance.send('useless_method', 3)
  end

  bm.report '(4)' do
    useless_instance.send(:useless_method, 3)
  end

  bm.report '(5)' do
    useless_instance.send('useless_generated_method', 3)
  end

  bm.report '(6)' do
    useless_instance.send(:useless_generated_method, 3)
  end

  bm.report '(7)' do
    useless_instance.useless_lambda.call(3)
  end

  bm.report '(8)' do
    useless_instance.instance_exec(3, &useless_instance.useless_lambda)
  end

  bm.report '(9)' do
    useless_instance.useless_missing_method(3)
  end
end
