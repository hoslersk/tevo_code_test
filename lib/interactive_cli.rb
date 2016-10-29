class InteractiveCLI

  attr_reader :text_parser, :text_displayer

  def initialize(text_parser, text_displayer)
    @text_parser = text_parser
    @text_displayer = text_displayer
  end

  def run_system
    command_prompt
    user_input = ""
    until user_input.downcase == "exit" do
      user_input = gets.chomp
      if user_input.downcase == "start"
        output_prompt
      elsif user_input.downcase == "options"
        command_prompt
      elsif user_input.to_i == 1
        text_displayer.output1(text_parser)
      elsif user_input.to_i == 2
        text_displayer.output2(text_parser)
      elsif user_input.to_i == 3
        text_displayer.output3(text_parser)
      elsif user_input.downcase == "all"
        text_displayer.omni_output(text_parser)
      elsif user_input.downcase != "exit"
        puts "Invalid command, please try again.\n\n"
      end
      puts "Enter command:\n\n"
    end
  end

  def command_prompt
    puts "Enter one of the following commands:"
    puts "Enter 'Start' to view data output options"
    puts "Enter 'Options' to repeat list of commands"
    puts "Enter 'Exit' to end process\n\n"
  end

  def output_prompt
    puts "Select how you to display data:"
    puts "Enter '1' for data sorted by gender and last name in descending order"
    puts "Enter '2' for data sorted by sorted by birth date, in ascending order"
    puts "Enter '3' for data sorted by sorted by last name in descending order"
    puts "Enter 'All' for all of the above\n\n"
  end

end
