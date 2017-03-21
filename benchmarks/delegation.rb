require 'benchmark/ips'
require 'delegate'
require 'forwardable'
require 'active_support/core_ext/module/delegation'

puts <<-DOC

DELEGATION

DOC


class AsManualDecorator
  def initialize(string)
    @string = string
  end

  def upcase
    @string.upcase
  end
end

class AsSimpleDecorator < SimpleDelegator
end

class AsForwardable
  extend Forwardable

  def initialize(string)
    @string = string
  end

  def_delegator :@string, :upcase
end

class AsActiveSupportDelegator
  def initialize(string)
    @string = string
  end

  delegate :upcase, to: :@string
end


Benchmark.ips do |bm|
  no_decoration    = 'string'
  manual_decorator = AsManualDecorator.new('string')
  simple_delegator = AsSimpleDecorator.new('string')
  forwardable      = AsForwardable.new('string')
  active_support   = AsActiveSupportDelegator.new('string')

  bm.report 'No decoration' do
    no_decoration.upcase
  end

  bm.report 'Manual decorator' do
    manual_decorator.upcase
  end

  bm.report 'SimpleDelegator' do
    simple_delegator.upcase
  end

  bm.report 'Forwardable' do
    forwardable.upcase
  end

  bm.report 'ActiveSupport' do
    active_support.upcase
  end
end
