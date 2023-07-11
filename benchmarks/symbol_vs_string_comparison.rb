require "benchmark/ips"

puts <<-DOC
#{RUBY_VERSION}

SYMBOL vs. STRING for comparisons

(1) Short symbols: :foo == :foo

(2) Long symbols: :long_symbol == :long_symbol

(3) Short strings: "foo" == "foo"

(4) Long strings with long common prefix: "long_string" == "long_string_other"

(5) Long strings with short common prefix: "long_string" == "other_long_string"

DOC

Benchmark.ips do |bm|
  bm.report "(1)" do
    :foo == :foo
    :foo == :bar
    :bar == :foo
  end

  bm.report "(2)" do
    :long_symbol == :long_symbol
    :long_symbol == :long_symbol_other
    :long_symbol_other == :long_symbol
  end

  bm.report "(3)" do
    "foo" == "foo"
    "foo" == "bar"
    "bar" == "foo"
  end

  bm.report "(4)" do
    "long_string" == "long_string"
    "long_string" == "long_string_other"
    "long_string_other" == "long_string"
  end

  bm.report "(5)" do
    "long_string" == "other_long_string"
    "long_string" == "other_long_string_other"
    "other_long_string" == "long_string"
  end
end
