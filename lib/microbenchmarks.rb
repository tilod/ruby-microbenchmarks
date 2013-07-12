require 'microbenchmarks/version'

require 'benchmark/ips'

require 'microbenchmarks/microbenchmark'
require 'microbenchmarks/method_lookup_speed'


module Microbenchmarks
  def self.run
    MethodLookupSpeed.run
  end
end
