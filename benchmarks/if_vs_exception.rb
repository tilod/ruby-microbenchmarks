require 'benchmark/ips'

puts <<-DOC

IF vs. EXCEPTION

DOC

ExceptionToRescue = Class.new(StandardError)

Benchmark.ips do |bm|
  bm.report 'With `if`' do
    1.upto(100) do |number|
      if number.odd?
        1 + 1
      else
        2 + 2
      end
    end
  end

  bm.report 'With exception' do
    1.upto(100) do |number|
      begin
        raise ExceptionToRescue if number.odd?
        2 + 2
      rescue ExceptionToRescue
        1 + 1
      end
    end
  end
end
