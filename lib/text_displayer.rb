require_relative './text_parser'

class TextDisplayer

  def output2(text_parser)
    consumer_list = text_parser.consumer_record[:consumers]
    dob_array = []
    consumer_list.each do |details, consumer|
      dob_array.push(consumer[:dob])
    end
    # puts dob_array.sort_by! {|date| date[-4..-1]}
    puts "Output 2:"
    dob_array.sort_by! do |date|
      if date.split("/")[0].to_i < 10 && date.split("/")[1].to_i < 10
        "0"+(date)
        "0"+(date.split("/")[1])
      elsif date.split("/")[0].to_i < 10 && date.split("/")[1].to_i > 9
        "0"+(date).gsub("/", "")
      elsif date.split("/")[0].to_i > 9 && date.split("/")[1].to_i < 10
        "0"+(date.split("/")[1])
      else
        date.gsub("/", "")
      end
    end

  end

  def output3(text_parser)
    consumer_list = text_parser.consumer_record[:consumers]
    consumer_list.sort_by! do |key|
      key[:last_name]
    end
    consumer_list.reverse!
    puts "Output 3:" # submits heading prior to iteration
      consumer_list.each do |details|
          puts "#{details[:last_name]} #{details[:first_name]} #{details[:gender]} #{details[:dob]} #{details[:favorite_color]}"
      end
  end

end

test_displayer = TextDisplayer.new

test_parser = TextParser.new

test_parser.parse_comma_txt('./input_files/comma.txt')
test_parser.parse_pipe_txt('./input_files/pipe.txt')
test_parser.parse_space_txt('./input_files/space.txt')

# test_displayer.output2(test_parser)
test_displayer.output3(test_parser)

# output 1:
# sorted by gender (females first/alphabetical) and then last name, ascending

# output 2:
# sorted by birthdate, ascending
