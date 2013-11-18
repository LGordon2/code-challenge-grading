module FibonacciHelper
  def fib(n)
    prev_last = 0
    return prev_last if n <= 0
    last = 1
    return last if n == 1

    for i in 2..n
      ans = last + prev_last
      prev_last = last
      last = ans
    end

    return ans
  end
  
  def all_fib(start, finish)
    all_nums = []
    (start..finish).each {|num| all_nums<<fib(num)}
    return all_nums.join(", ")
  end
end
