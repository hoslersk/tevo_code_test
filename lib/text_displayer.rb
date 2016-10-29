require_relative './text_parser'

class TextDisplayer

  def omni_output(text_parser)
    output1(text_parser)
    output2(text_parser)
    output3(text_parser)
  end

  def output_display(consumer_list, current_method)
    puts "Output #{current_method.to_s[-1]}:" # interpolates the output number from method name
    consumer_list.each do |details|
      puts "#{details[:last_name]} #{details[:first_name]} #{details[:gender]} #{details[:dob]} #{details[:favorite_color]}"
    end
    puts "\n" # adds spacing found in output sample
  end

  def output1(text_parser)
    consumer_list = text_parser.consumer_record[:consumers]
    consumer_list.sort_by! do |details|
      [ details[:gender], details[:last_name] ] # sorts by gender, then by last name
    end
    output_display(consumer_list, __method__) # passing current method as argument for more dynamic use
  end

  def output2(text_parser)
    consumer_list = text_parser.consumer_record[:consumers]
    consumer_list.sort_by! do |details|
      [ details[:dob].split("/")[2], details[:dob].split("/")[0], details[:dob].split("/")[1], details[:last_name] ]
      # sorts in order of birth year, month, day, and then last name (for examples w/ repeat dob)
    end
    output_display(consumer_list, __method__) # passing current method as argument for more dynamic use
  end

  def output3(text_parser)
    consumer_list = text_parser.consumer_record[:consumers] # pulling data from text parser
    consumer_list.sort_by! do |details|
      details[:last_name] # sorting by last name
    end
    consumer_list.reverse! # reversing for descending order
    output_display(consumer_list, __method__) # passing current method as argument for more dynamic use
  end

end
