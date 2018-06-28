require 'fib/version'

# For much higher performance, there exist native gems
# We could also use the job_interview gem: https://github.com/ruby-jokes/job_interview

# FWIW I did this problem on Project Euler in 2012. I did not create a gem for it at that time.
# My "get the answer quickly" solution then is at https://github.com/tilthouse/project_euler/blob/master/problems/002/answer002.rb

module Fib
  class Recursive
    attr_accessor :values

    def initialize
      @values = {}
    end

    # Customers gotta have their fibbonacci numbers
    def value(n)
      return @values[n] unless @values[n].nil?
      @values[n] = if n < 1
                     0
                   elsif n <= 2
                     1
                   else
                     value(n - 1) + value(n - 2)
                   end
    end

    # This would not be in a real gem – but have to answer the
    # actual question somewhere
    MAX_FIB_VALUE = 4_000_000
    def self.project_euler_net_2
      fib_calculator = Fib::Recursive.new
      index = 0
      even_acc = 0
      last_value = 0
      while last_value <= MAX_FIB_VALUE
        last_value = fib_calculator.value(index)
        even_acc += last_value if last_value.even?
        index += 1
      end
      even_acc
    end
  end
end
