def numbers_to_words( the_number )
  matches = {
    0 => 'Zero',
    1 => 'One',
    2 => 'Two',
    3 => 'Three',
    4 => 'Four',
    5 => 'Five',
    6 => 'Six',
    7 => 'Seven',
    8 => 'Eight',
    9 => 'Nine',
    10 => 'Ten',
    11 => 'Eleven',
    12 => 'Twelve',
    13 => 'Thirteen',
    14 => 'Forteen',
    15 => 'Fifteen',
    16 => 'Sixteen',
    17 => 'Seventeen',
    18 => 'Eighteen',
    19 => 'Nineteen',
    20 => 'Twenty',
    30 => 'Thirty',
    40 => 'Forty',
    50 => 'Fifty',
    60 => 'Sixty',
    70 => 'Seventy',
    80 => 'Eighty',
    90 => 'Ninety',
    100 => 'Hundred',
    1000 => 'Thousand',
    1000000 => 'million',
    1000000000 => 'billion',
    1000000000000 => 'trillion',
    1000000000000000 => 'quadrillion',
    1000000000000000000 => 'quintillion'
  }

  case true
  when the_number < 21
    matches[ the_number ]
  when the_number < 100
    tens = ( the_number / 10 ) * 10
    units = the_number % 10
    matches[ tens ] + ' ' + matches[ units ]
  when the_number < 1000
    hundreds  = the_number / 100
    rem       = the_number % 100
    if rem && rem != 0
      the_words = matches [ hundreds ] + ' ' + matches[ 100 ]
      tens = numbers_to_words( rem )
      "#{the_words} and #{tens}"
    else
      matches [ hundreds ] + ' ' + matches[ 100 ]
    end
  when the_number < 10000
    thousands = the_number / 1000
    rem = check_remains( the_number )
    the_words = matches[ thousands ] + ' ' + matches[ 1000 ]
    "#{the_words}#{rem}"
  when the_number < 100000
    ten_thousands = the_number / 1000
    rem = check_remains( the_number % 1000 )
    the_words = matches[ ten_thousands ] +' '+ matches[ 1000 ]
    "#{the_words}#{rem}"
  when the_number < 1000000
    hun_thousands = the_number / 1000
    rem = check_remains( the_number % 1000 )
    the_words = numbers_to_words( hun_thousands ) +' '+ matches[ 1000 ] +' '+ numbers_to_words( the_number - ( hun_thousands * 1000 ) )
    the_words
  when the_number < 10000000
    millions = the_number / 1000000
    the_words = numbers_to_words( millions )+' '+ matches[ 1000000] +' '+ numbers_to_words( the_number - 1000000 )
  end

end

def check_remains( the_number )
  rem = the_number % 1000
  rem = ( rem && rem != 0 )? ', ' + numbers_to_words( rem ) : ''
end


puts( "Please enter number" )
puts numbers_to_words( gets.chomp( ).to_i )
