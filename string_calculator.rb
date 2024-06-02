class StringCalculator
  def add(input)
    valid_input(input)
    numbers = input.split(/[^0-9-]+/).map(&:to_i)
    validate_for_negative_numbers(numbers)
    numbers = remove_numbers_exceeding_limit(numbers)
    numbers.sum
  end

  private

  def remove_numbers_exceeding_limit(numbers)
    numbers.select { |number| number <= 1000 }
  end

  def validate_for_negative_numbers(numbers)
    negative_numbers = numbers.select(&:negative?)
    raise "Negative numbers not allowed <#{negative_numbers.join(', ')}>" unless negative_numbers.empty?
  end

  def valid_input(input)
    raise 'Only accept string as an input' unless input.is_a? String
  end
end
