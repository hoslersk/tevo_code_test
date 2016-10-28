require_relative './text_parser'

class TextDisplayer

  def output3(text_parser)
    # text_parser.consumer_record
    consumer_list = text_parser.consumer_record[:consumers]
    last_name_array = []
    consumer_list.each do |details, consumer|
      last_name_array.push(consumer[:last_name])
    end
    last_name_array.sort!.reverse!
    puts "Output 3:"
    last_name_array.each do |last_name|
      consumer_list.each do |details, consumer|
        if consumer[:last_name] == last_name
          puts "#{consumer[:last_name]} #{consumer[:first_name]} #{consumer[:gender]} #{consumer[:dob]} #{consumer[:favorite_color]}"
        end
      end
    end
  end

end

test_displayer = TextDisplayer.new

test_parser = TextParser.new

test_parser.parse_comma_txt('./input_files/comma.txt')
test_parser.parse_pipe_txt('./input_files/pipe.txt')
test_parser.parse_space_txt('./input_files/space.txt')

test_displayer.output3(test_parser)

# output 1:
# sorted by gender (females first/alphabetical) and then last name, ascending

# output 2:
# sorted by birthdate, ascending

# output 3:
# sorted by last name, descending
