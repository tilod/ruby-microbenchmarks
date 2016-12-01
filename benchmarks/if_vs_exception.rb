require 'benchmark/ips'

ExceptionToRescue = Class.new(StandardError)

Benchmark.ips do |bm|
  bm.report 'with `if`' do
    (1..100).each do |number|
      check_condition =
        if number.odd?
          :odd
        else
          :even
        end

      if check_condition == :odd
        1 + 1
      else
        2 + 2
      end
    end
  end

  bm.report 'with exception' do
    (1..100).each do |number|
      begin
        raise ExceptionToRescue if number.odd?
        2 + 2
      rescue ExceptionToRescue
        1 + 1
      end
    end
  end
end
