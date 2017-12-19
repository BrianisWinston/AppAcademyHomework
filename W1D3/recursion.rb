require "byebug"

def range(start, last)
  #(start ... end)
  ret = [start]
  # debugger
  if start == last
    return []
  end
  ret + range(start + 1, last)
end

def range_i(start, last)
  ans = []
  while last > start
    ans << start
    start += 1
  end
  ans
end

# p range(1, 1)
# p range_i(1, 10)
def exponentiation(base, power)
  return 1 if power == 0
  base * exponentiation(base, power - 1)
end

# p exponentiation(5, 20)

def exp2(base, power)
  return 1 if power == 0
  return base if power == 1
  if power % 2 == 0
    exp2(base, power/2) * exp2(base, power/2)
  else
    base * exp2(base, (power - 1) / 2) * exp2(base, (power - 1) / 2)
  end
end

# p exp2(2, 3)
# p exp2(2, 6)

def deep_dup(arr)
  ans = []
  arr.each do |elt| #can use map
    if elt.is_a?(Array)
      ans.concat([deep_dup(elt)])
    else
      ans << elt
    end
  end
  ans
end
#
# arr1 = [1, [2], [3, [4]]]
# p arr2 = deep_dup(arr1)

# def fib_sequence(n)
#   ans = [0, 1]
#   # debugger
#   until ans.length == n
#     ans << ans[-1] + ans[-2]
#   end
#   ans
# end
#
def fib_sequence1(n)
  return [0] if n == 0
  return [0, 1] if n == 1
  #return [0, 1] if n == 2
  old_seq = fib_sequence1(n-1)
  next_val = fib_sequence1(n-1)[-2] + fib_sequence1(n-1)[-1]
  old_seq + [next_val]
end

#fib(5) = [0, 1, 1, 2, 3 ]

# p fib_sequence1(4)

def subsets(arr)
  ans = [[]]
  arr.length.times do |id|
    id2 = id + 1
    ans << [arr[id]]
    while id2 < arr.length
      ans << arr[id..id2]
      id2 += 1
    end
  end
  ans
end

# p subsets([1, 2, 3])

# def permutations(arr)
#   ans = []
#   arr.length.times do |i|
#   ans << p_help(arr)
# end

def binary_search(arr, target)
  if arr.length == 1
    return nil if arr[0] != target
  end
  mid = arr.length / 2
  if target == arr[mid]
    return mid
  elsif target > arr[mid]
    if binary_search(arr[mid..arr.length], target) == nil
      return nil
    else
      return binary_search(arr[mid..arr.length], target) + arr.length / 2
    end
  else
    binary_search(arr[0..mid-1], target)
  end
end

# p binary_search([1, 2, 3], 1) # => 0
# p binary_search([2, 3, 4, 5], 3) # => 1
# p binary_search([2, 4, 6, 8, 10], 6) # => 2
# p binary_search([1, 3, 4, 5, 9], 5) # => 3
# p binary_search([1, 2, 3, 4, 5, 6], 6) # => 5
# p binary_search([1, 2, 3, 4, 5, 6], 0) # => nil
# p binary_search([1, 2, 3, 4, 5, 7], 6) # => nil

def merge_sort(arr)
  return arr if arr.length <= 1
end
