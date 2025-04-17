class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?
   
    delimiters = /,|\n/
    num_str = numbers

    # Custom delimiter syntax: //[delim]\n[numbers]
    if numbers.start_with?('//')
      delimiter_spec, num_str = numbers.split("\n", 2)
      custom = delimiter_spec[2..]
      delimiters = Regexp.new(Regexp.escape(custom))
    end

    nums = num_str.split(delimiters).map(&:to_i)
    nums.sum
  end
end
