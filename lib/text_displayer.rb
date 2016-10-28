require_relative './text_parser'

class TextDisplayer

  def output1(text_parser)
    # text_parser.consumer_record
  end

end

test_displayer = TextDisplayer.new

test_parser = TextParser.new

test_parser.parse_comma_txt('./input_files/comma.txt')
test_parser.parse_pipe_txt('./input_files/pipe.txt')
test_parser.parse_space_txt('./input_files/space.txt')

test_displayer.output1(test_parser)

# output 1:
# sorted by gender (females first/alphabetical) and then last name, ascending

# output 2:
# sorted by birthdate, ascending

# output 3:
# sorted by last name, descending
