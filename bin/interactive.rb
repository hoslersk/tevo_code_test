require './lib/text_parser'
require './lib/text_displayer'
require './lib/interactive_cli'

test_parser = TextParser.new

test_parser.omni_parser

test_displayer = TextDisplayer.new

test_cli = InteractiveCLI.new(test_parser, test_displayer)

test_cli.run_system
