require 'byebug'

def sum_to(num)
  return nil if num <= 0
  return num if num == 1
  num + sum_to(num - 1)
end

p '--------------------------------------------'
p sum_to(5)  # => returns 15
p sum_to(1)  # => returns 1
p sum_to(9)  # => returns 45
p sum_to(-8)  # => returns nil

def add_numbers(num)
  return nil if num.empty?
  return num[0] if num.length == 1
  num[0] + add_numbers(num[1..-1])
end

p '--------------------------------------------'
p add_numbers([1,2,3,4]) # => returns 10
p add_numbers([3]) # => returns 3
p add_numbers([-80,34,7]) # => returns -39
p add_numbers([]) # => returns nil

def gamma_fnc(num)
  return nil if num.zero?
  return num if num == 1
  (num - 1) * gamma_fnc(num - 1)
end

p '--------------------------------------------'
p gamma_fnc(0)  # => returns nil
p gamma_fnc(1)  # => returns 1
p gamma_fnc(4)  # => returns 6
p gamma_fnc(8)  # => returns 5040

def ice_cream_shop(ice_creams, ice_cream)
  return false if ice_creams.empty?
  return true if ice_creams[0] == ice_cream
  return false if ice_creams.length == 1
  ice_cream_shop(ice_creams[1..-1], ice_cream)
end

p '--------------------------------------------'
p ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')  # => returns false
p ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea')  # => returns true
p ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio')  # => returns false
p ice_cream_shop(['moose tracks'], 'moose tracks')  # => returns true
p ice_cream_shop([], 'honey lavender')  # => returns false

def reverse(str)
  return '' if str.empty?
  return str[0] if str.length == 1
  str[-1] + reverse(str[0..-2])
end

p '--------------------------------------------'
p reverse("house") # => "esuoh"
p reverse("dog") # => "god"
p reverse("atom") # => "mota"
p reverse("q") # => "q"
p reverse("id") # => "di"
p reverse("") # => ""
