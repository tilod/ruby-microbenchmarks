require 'benchmark/ips'

puts <<-DOC

VARIABLE ACCESS

DOC


class Foo
  attr_reader :var

  def initialize(var)
    @var = var
  end

  def var_by_def
    @var
  end


  def method_call
    3
  end

  def access_by_ivar
    @var
  end

  def access_by_attr_reader
    var
  end

  def access_by_def
    var_by_def
  end
end

Benchmark.ips do |bm|
  instance = Foo.new(3)

  bm.report '(baseline)' do
    instance.method_call
  end

  bm.report '@var' do
    instance.access_by_ivar
  end

  bm.report 'attr_reader :var' do
    instance.access_by_attr_reader
  end

  bm.report 'def var' do
    instance.access_by_def
  end

end
