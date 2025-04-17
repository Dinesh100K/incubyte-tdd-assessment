# incubyte-tdd-assessment
# String Calculator

A simple string calculator implemented in Ruby.

## Features

* Calculates the sum of numbers in a given string
* Supports custom delimiters
* Handles negative numbers and raises an error
* Ignores numbers greater than 1000 (optional)

## Usage

To use the string calculator, create an instance of the `StringCalculator` class and call the `add` method with a string containing numbers.

```ruby
calc = StringCalculator.new
result = calc.add("1,2,3")
puts result # Output: 6
