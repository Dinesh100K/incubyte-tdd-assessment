class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?
   
    delimiters = determine_delimiters(numbers)
    num_str = extract_numbers_string(numbers)

    nums = num_str.split(delimiters).map(&:to_i)

     # Check for negatives
     negatives = nums.select { |n| n.negative? }
     if negatives.any?
       raise ArgumentError, "negative numbers not allowed #{negatives.join(',')}"
     end
 
    nums.sum
  end

  private

  def determine_delimiters(numbers)
    if numbers.start_with?('//')
      delimiter_spec, = numbers.split("\n", 2)
      custom = delimiter_spec[2..]
      Regexp.new(Regexp.escape(custom))
    else
      /,|\n/
    end
  end

  def extract_numbers_string(numbers)
    if numbers.start_with?('//')
      numbers.split("\n", 2).last
    else
      numbers
    end
  end
end
