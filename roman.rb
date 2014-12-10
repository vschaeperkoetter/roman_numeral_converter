require 'minitest/spec'
require 'minitest/autorun'
require 'yaml'

class RomanNumerals

  def self.to_roman number
    roman_string = ""

    roman_string << "Q" * (number/10000)
    number -= (10000 * (number/10000) )

    numerals = ["MQ", "P", "MP", "M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV"]
    divisors = [9000,5000,4000,1000,900,500,400,100,90,50,40,10,9,5,4]

    numerals.each_with_index do |numeral,index|
      divisor = divisors[index]

      if number >= divisor
        roman_string << numeral * (number/divisor)
        number -= (divisor * (number/divisor))
      end
    end

    roman_string << "I" * number
    roman_string
  end

  def self.to_arabic

  end

end

describe RomanNumerals do
  ARABIC_ROMAN_MAP = YAML.load_file "fixture.yml"

  ARABIC_ROMAN_MAP.each do |arabic, roman|
    it "converts #{arabic} to #{roman}" do
      RomanNumerals.to_roman(arabic).must_equal roman
    end
  end

  # ARABIC_ROMAN_MAP.each do |arabic, roman|
  #   it "converts #{roman} to #{arabic}" do
  #     RomanNumerals.to_arabic(roman).must_equal arabic
  #   end
  # end
end
