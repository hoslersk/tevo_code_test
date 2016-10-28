require './lib/text_parser'
require './lib/text_displayer'

test_parser = TextParser.new

test_parser.parse_comma_txt('./input_files/comma.txt')
test_parser.parse_pipe_txt('./input_files/pipe.txt')
test_parser.parse_space_txt('./input_files/space.txt')

test_displayer = TextDisplayer.new

test_displayer.output1(test_parser)
test_displayer.output2(test_parser)
test_displayer.output3(test_parser)
