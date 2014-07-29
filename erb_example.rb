require 'erb'

x = 42
template = ERB.new "The value of x is: <%= x %>"
puts template.result(binding)

y = [1, 2, 3, 4]
str = "valid"
item = ERB.new "The value of y is <%= str %>"
puts item.result(binding)
