require './lib/text_parser'
require './lib/text_displayer'

test_parser = TextParser.new

test_parser.omni_parser

test_displayer = TextDisplayer.new

test_displayer.output1(test_parser)
test_displayer.output2(test_parser)
test_displayer.output3(test_parser)
