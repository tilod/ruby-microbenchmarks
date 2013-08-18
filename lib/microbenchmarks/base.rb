require 'microbenchmarks'

module Microbenchmarks
  class Base
    class << self
      def short_desc(text)
        @_short_desc = text
      end

      def long_desc(text)
        @_long_desc = text
      end

      def get_short_desc
        @_short_desc
      end

      def get_long_desc
        @_long_desc
      end


      def run
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
end
