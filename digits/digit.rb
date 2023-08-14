# Calculates the sum of digits of a number, until the result is one digit
class Digit
  def sum(number)
    # Flag to while loop
    split_again = true
    response = number
    while split_again == true
      new_number = calculateNumber(response)
      response = new_number
      split_again = false if split(new_number).size == 1
    end
    response
  end
  
  private

  def split(number)
    number.to_s.split('')
  end

  def calculateNumber(number)
    result = 0
    digits = split(number) # ? Split number to digits
    digits.each { |digit| result += digit.to_i }
    result
  end
end
