require './lib/text_parser'

test_parse = TextParser.new

test_parse.parse_comma_txt('./input_files/comma.txt')
test_parse.parse_pipe_txt('./input_files/pipe.txt')
test_parse.parse_space_txt('./input_files/space.txt')
