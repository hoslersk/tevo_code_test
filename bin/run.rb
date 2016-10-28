require './lib/text_parser'

test_parser = TextParser.new

test_parser.parse_comma_txt('./input_files/comma.txt')
test_parser.parse_pipe_txt('./input_files/pipe.txt')
test_parser.parse_space_txt('./input_files/space.txt')
