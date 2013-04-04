# require 'pry'
# add binding.pry to create break

class RomanNumeralConverter
 
  TABLE2 = {
    "IV" => 4,
    "IX" => 9,
    "XL" => 40,
    "XC" => 90,
    "CD" => 400,
    "CM" => 900
  }

  TABLE1 = {
    "I" => 1,
    "V" => 5,
    "X" => 10,
    "L" => 50,
    "C" => 100,
    "D" => 500,
    "M" => 1000
  }
 
  def convert(roman_numeral)
    
    arabic_numeral = 0 

    while roman_numeral.size > 0

      while TABLE2.include?(roman_numeral[0,2])
        arabic_numeral += TABLE2[roman_numeral[0,2]]
        roman_numeral[0,2] = ""
      end

      if TABLE1.include?(roman_numeral[0])
        arabic_numeral += TABLE1[roman_numeral[0]]
        roman_numeral[0] = ""
      end
    end

    return arabic_numeral
  
  end
end
 
require 'test/unit'
 
class ArabicNumeralConverterTest < Test::Unit::TestCase
 
  def setup
    @converter = RomanNumeralConverter.new
  end
 
  def test_mcmxcix_returns_1999
    assert_equal 1999, @converter.convert("MCMXCIX")
  end

  def test_mcmiv_returns_1904
    assert_equal 1904, @converter.convert("MCMIV")
  end
 
   def test_xx_returns_twenty
    assert_equal 20, @converter.convert("XX")
  end
 
  def test_xix_returns_nineteen
    assert_equal 19, @converter.convert("XIX")
  end
 
  def test_xv_returns_fifteen
    assert_equal 15, @converter.convert("XV")
  end
 
  def test_xiv_returns_fourteen
    assert_equal 14, @converter.convert("XIV")
  end
 
  def test_xi_returns_eleven
    assert_equal 11, @converter.convert("XI")
  end
 
  def test_x_returns_ten
    assert_equal 10, @converter.convert("X")
  end
 
  def test_ix_returns_nine
    assert_equal 9, @converter.convert("IX")
  end
 
  def test_viii_returns_eight
    assert_equal 8, @converter.convert("VIII")
  end
 
  def test_vii_returns_seven
    assert_equal 7, @converter.convert("VII")
  end
 
  def test_vi_returns_six
    assert_equal 6, @converter.convert("VI")
  end
 
  def test_v_returns_five
    assert_equal 5, @converter.convert("V")
  end
  
  def test_iv_returns_four
    assert_equal 4, @converter.convert("IV")
  end
  
  def test_iii_returns_three
    assert_equal 3, @converter.convert("III")
  end
 
  def test_ii_returns_two
    assert_equal 2, @converter.convert("II")
  end
 
  def test_i_returns_one
    assert_equal 1, @converter.convert("I")
  end
end