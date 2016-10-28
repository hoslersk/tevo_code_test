require 'pry'

class TextParser

  attr_accessor :consumer_record

  def initialize
    @consumer_record = {consumers: {}}
  end

  def full_gender(gender)
    consumer_gender = ""
    if gender == "M"
      consumer_gender = "Male"
    elsif gender == "F"
      consumer_gender = "Female"
    end
  end

  def remove_new_line(line)
    line.gsub!("\n", "")
  end

  def consumer_hash_symbol(consumer_details)
    return "#{consumer_details[1]} #{consumer_details[0]}"
  end

  def format_date(date)
    date.gsub!("-", "/")
  end

  def parse_comma_txt(comma_txt_path)
    File.readlines(comma_txt_path).each do |line| # sets each line of text file as "line"
      remove_new_line(line) # removes new line
      consumer_details = line.split(", ") # splits each detail into items in an array
      # line.split(/[\s,]/)
      consumer_symbol = consumer_hash_symbol(consumer_details) # creates hash symbol out of full name
      consumer_record[:consumers][consumer_symbol] = {} # sets up nested hash for each consumer
      consumer_record[:consumers][consumer_symbol][:last_name] = consumer_details[0]
      consumer_record[:consumers][consumer_symbol][:first_name] = consumer_details[1]
      consumer_record[:consumers][consumer_symbol][:gender] = consumer_details[2]
      consumer_record[:consumers][consumer_symbol][:favorite_color] = consumer_details[3]
      consumer_record[:consumers][consumer_symbol][:dob] = consumer_details[4]
    end
  end

  def parse_pipe_txt(pipe_txt_path)
    File.readlines(pipe_txt_path).each do |line|
      remove_new_line(line) # removes new line
      consumer_details = line.split(" | ") # splits each detail into items in an array
      consumer_symbol = consumer_hash_symbol(consumer_details) # creates hash symbol out of full name
      consumer_record[:consumers][consumer_symbol] = {} # sets up nested hash for each consumer
      consumer_record[:consumers][consumer_symbol][:last_name] = consumer_details[0]
      consumer_record[:consumers][consumer_symbol][:first_name] = consumer_details[1]
      consumer_record[:consumers][consumer_symbol][:gender] = full_gender(consumer_details[3])
      consumer_record[:consumers][consumer_symbol][:favorite_color] = consumer_details[4]
      consumer_record[:consumers][consumer_symbol][:dob] = format_date(consumer_details[5])
    end
  end

  def parse_space_txt(space_txt_path)
    File.readlines(space_txt_path).each do |line|
      remove_new_line(line) # removes new line
      consumer_details = line.split(" ") # splits each detail into items in an array
      consumer_symbol = consumer_hash_symbol(consumer_details) # creates hash symbol out of full name
      consumer_record[:consumers][consumer_symbol] = {} # sets up nested hash for each consumer
      consumer_record[:consumers][consumer_symbol][:last_name] = consumer_details[0]
      consumer_record[:consumers][consumer_symbol][:first_name] = consumer_details[1]
      consumer_record[:consumers][consumer_symbol][:gender] = full_gender(consumer_details[3])
      consumer_record[:consumers][consumer_symbol][:favorite_color] = consumer_details[5]
      consumer_record[:consumers][consumer_symbol][:dob] = format_date(consumer_details[4])
    end
  end

end

# output 1:
# sorted by gender (females first/alphabetical) and then last name, ascending
# output 2:
# sorted by birthdate, ascending
# output 3:
# sorted by last name, descending
