require 'test_helper'

class FibTest < Minitest::Test
  context 'gem' do
    should 'have a version number' do
      refute_nil ::Fib::VERSION
    end
  end

  context 'recursive calculations' do
    setup do
      @fib = Fib::Recursive.new
    end
    should 'be correct for 0' do
      assert_equal 0, @fib.value(0)
    end

    should 'be correct for 1' do
      assert_equal 1, @fib.value(1)
    end

    should 'be correct for 2' do
      assert_equal 1, @fib.value(2)
    end

    should 'be correct for 3' do
      assert_equal 2, @fib.value(3)
    end

    should 'be correct for 4' do
      assert_equal 3, @fib.value(4)
    end

    should 'be correct for a large value' do
      assert_equal 12586269025, @fib.value(50)
    end

    should 'tell me the answer to Project Euler #2' do
      assert_equal 4613732, Fib::Recursive.project_euler_net_2
    end
  end
end
