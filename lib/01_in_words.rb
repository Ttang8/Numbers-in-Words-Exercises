class Fixnum

  def in_words
    if self < 10
      Zero_to_nine[self]
    elsif self < 20
      Ten_to_nineteen[self]
    elsif self < 100

      if self % 10 == 0
        Tens[self]
      else
        less_than_hundred(self)
      end

    else
      magnitude = what_magnitude
      magnitude_in_words = (self / magnitude).in_words + " " + Magnitude[magnitude]
        if self % magnitude == 0
          magnitude_in_words
        else
          magnitude_in_words + " " + (self % magnitude).in_words
        end
    end
  end

private

  def what_magnitude
    Magnitude.keys.select { |mag| mag <= self}.last
  end

  def less_than_hundred(int)
    tens = int - int % 10
    "#{Tens[tens]} #{Zero_to_nine[int % 10]}"
  end

  Zero_to_nine = {
    0 => "zero",
    1 => "one",
    2 => "two",
    3 => "three",
    4 => "four",
    5 => "five",
    6 => "six",
    7 => "seven",
    8 => "eight",
    9 => "nine",
  }

  Ten_to_nineteen = {
    10 => "ten",
    11 => "eleven",
    12 => "twelve",
    13 => "thirteen",
    14 => "fourteen",
    15 => "fifteen",
    16 => "sixteen",
    17 => "seventeen",
    18 => "eighteen",
    19 => "nineteen",
  }

  Tens = {
    20 => "twenty",
    30 => "thirty",
    40 => "forty",
    50 => "fifty",
    60 => "sixty",
    70 => "seventy",
    80 => "eighty",
    90 => "ninety",
  }

  Magnitude = {
    100 => "hundred",
    1_000 => "thousand",
    1_000_000 => "million",
    1_000_000_000 => "billion",
    1_000_000_000_000 => "trillion",
  }
end
