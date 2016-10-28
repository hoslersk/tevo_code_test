require_relative './text_parser'

class TextDisplayer

  def output_display(consumer_list, current_method)
    puts "Output #{current_method.to_s[-1]}:" # interpolates the output number from method name
    consumer_list.each do |details|
        puts "#{details[:last_name]} #{details[:first_name]} #{details[:gender]} #{details[:dob]} #{details[:favorite_color]}" # interpolates all necessary data in presorted order
    end
  end

  def output2(text_parser)
    consumer_list = text_parser.consumer_record[:consumers]
    consumer_list.sort_by! do |key|
      key[:dob][-4..-1]
      # if key[:dob].split("/")[0].to_i < 10 && key[:dob].split("/")[1].to_i < 10
      #   "0" + key[:dob].split("/")[0] + "0" + key[:dob].split("/")[1] + key[:dob].split("/")[2]
      # elsif key[:dob].split("/")[0].to_i < 10 && key[:dob].split("/")[1].to_i > 9
      #   "0"+(key[:dob]).gsub("/", "")
      # elsif key[:dob].split("/")[0].to_i > 9 && key[:dob].split("/")[1].to_i < 10
      #   key[:dob].split("/")[0] + "0" + (key[:dob].split("/")[1]) + key[:dob].split("/")[2]
      # else
      #   key[:dob].gsub("/", "")
      # end
    end
    output_display(consumer_list, __method__) # passing current method as argument for dynamic use of integer
  end

  def output3(text_parser)
    consumer_list = text_parser.consumer_record[:consumers] # pulling data from text parser
    consumer_list.sort_by! do |key|
      key[:last_name] # sorting by last name
    end
    consumer_list.reverse! # reversing for descending order
    output_display(consumer_list, __method__) # passing current method as argument for dynamic use of integer
  end

end

test_displayer = TextDisplayer.new

test_parser = TextParser.new

test_parser.parse_comma_txt('./input_files/comma.txt')
test_parser.parse_pipe_txt('./input_files/pipe.txt')
test_parser.parse_space_txt('./input_files/space.txt')

test_displayer.output2(test_parser)
test_displayer.output3(test_parser)

# output 1:
# sorted by gender (females first/alphabetical) and then last name, ascending

# output 2:
# sorted by birthdate, ascending
