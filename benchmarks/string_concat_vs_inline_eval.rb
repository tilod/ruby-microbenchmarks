require 'benchmark/ips'


puts <<-'DOC'
STRING CONCATANATION vs. TEMPLATE STRING vs. INLINE EVAL

(1) Concat with `+`:
    Concating the strings with String#+ which creates a new string every time it
    is called.

(2) Append with `<<`:
    Appending tho the original string using `String#<<`. This does not create a
    new string.

(3) Append with `+=`:
    Appending tho the original string using `String#+=`. This creates a new
    string every time it is called and replaces the old string with the result.

(4) Template string with array:
    Create a string with `%d` and use `%` with an array to substitute the
    placeholders.

(5) Template string with hash:
    Create a string with `%<name>d` and use `%` with a hash to substitute the
    placeholders. 

(6) Inline eval:
    Using inline evaluation `#{}` to build up the string.

DOC


Benchmark.ips do |bm|
  bm.report 'concat with `+`' do
    'first'  + (1 + 1).to_s +
    'second' + (2 + 2).to_s +
    'third'  + (3 + 3).to_s +
    'fourth' + (4 + 4).to_s +
    'fifth'  + (5 + 5).to_s
  end

  bm.report 'append with `<<`' do
    string  = 'first'
    string << 1 + 1
    string << 'second' 
    string << 2 + 2
    string << 'third'  
    string << 3 + 3
    string << 'fourth' 
    string << 4 + 4
    string << 'fifth'  
    string << 5 + 5
  end

  bm.report 'append with `+=`' do
    string  = 'first'
    string += (1 + 1).to_s
    string += 'second'
    string += (2 + 2).to_s
    string += 'third'
    string += (3 + 3).to_s
    string += 'fourth'
    string += (4 + 4).to_s
    string += 'fifth'
    string += (5 + 5).to_s
  end

  bm.report 'template with array' do
    "first%dsecond%dthird%dfourth%dfifth%d" % [1 + 1, 2 + 2, 3 + 3, 4 + 4, 5 + 5]
  end

  bm.report 'template with hash' do
    "first%<first>dsecond%<second>dthird%<third>dforth%<forth>dfifth%<fifth>d" % {
      first: 1 + 1,
      second: 2 + 2,
      third: 3 + 3,
      forth: 4 + 4,
      fifth: 5 + 5,
    }
  end

  bm.report 'inline eval' do
    "first#{1 + 1}second#{2 + 2}third#{3 + 3}fourth#{4 + 4}fifth#{5 + 5}"
  end
end
