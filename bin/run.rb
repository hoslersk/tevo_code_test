require './lib/text_parser'
require './lib/text_displayer'

test_parser = TextParser.new

test_parser.omni_parser

test_displayer = TextDisplayer.new

test_displayer.omni_output(test_parser)
