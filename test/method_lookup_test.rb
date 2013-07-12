require 'minitest-helper'

describe MethodLookup do
  describe '#bla' do
    subject { MethodLookup.new.bla }

    it { must_equal 'bla' }
  end
end
