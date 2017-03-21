require 'benchmark/ips'

puts <<-DOC

METHOD LOOKUP SPEED

Speed of the method lookup in Ruby for deep ancestor trees

(1) One class:
    Define all 1000 methods in one class and call five of them.

(2) 10 deep:
    Define 10 modules with 100 methods each and include them in the class. Call
    five methods, equally distributed in the depth of the ancestor tree.

(3) 100 deep:
    Define 100 modules with 10 methods each and include them in the class. Call
    five methods, equally distributed in the depth of the ancestor tree.

(4) 1000 deep:
    Define 1000 modules with one method each and include them in the class. Call
    five methods, equally distributed in the depth of the ancestor tree.

DOC


class OneClass
  0.upto 999 do |i|
    define_method "method_#{i}" do
      i * 2
    end
  end
end

class Deep10
  0.step 900, 100 do |i|
    to_include = Module.new do
      0.upto 99 do |j|
        define_method "method_#{i + j}" do
          i * 2
        end
      end
    end
    include to_include
  end
end

class Deep100
  0.step 990, 10 do |i|
    to_include = Module.new do
      0.upto 9 do |j|
        define_method "method_#{i + j}" do
          i * 2
        end
      end
    end
    include to_include
  end
end

class Deep1000
  0.upto 999 do |i|
    to_include = Module.new do
      define_method "method_#{i}" do
        i * 2
      end
    end
    include to_include
  end
end

def call_methods(instance)
  instance.method_0
  instance.method_250
  instance.method_500
  instance.method_750
  instance.method_999
end


Benchmark.ips do |bm|
  bm.report 'One class' do
    call_methods(OneClass.new)
  end

  bm.report('10 deep') do
    call_methods(Deep10.new)
  end

  bm.report('100 deep') do
    call_methods(Deep100.new)
  end

  bm.report('1000 deep') do
    call_methods(Deep1000.new)
  end
end
