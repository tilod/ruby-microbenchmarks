require 'microbenchmarks'

module Microbenchmarks
  class Microbenchmark
    def self.description(description)
      @description = description
    end

    def self.run
      puts @description

      benchmark_instance = self.new
      Benchmark.ips do |bm|
        benchmark_instance.public_methods(false).each do |method|
          bm.report method.to_s do
            benchmark_instance.send method
          end
        end
      end
    end
  end
end
