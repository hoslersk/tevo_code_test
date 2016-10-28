require 'pry'

class TextParser

  attr_reader :consumer_record

  def initialize
    @consumer_record = {consumers: Array.new}
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

  def format_date(date)
    date.gsub!("-", "/")
  end

  def parse_comma_txt(comma_txt_path)
    File.readlines(comma_txt_path).each do |line| # sets each line of text file as "line"
      remove_new_line(line) # removes new line
      consumer_details = line.split(", ") # splits each detail into items in an array
      consumer_data = {
        last_name: consumer_details[0],
        first_name: consumer_details[1],
        gender: consumer_details[2],
        favorite_color: consumer_details[3],
        dob: consumer_details[4]
      }
      consumer_record[:consumers].push(consumer_data)
    end
  end

  def parse_pipe_txt(pipe_txt_path)
    File.readlines(pipe_txt_path).each do |line|
      remove_new_line(line) # removes new line
      consumer_details = line.split(" | ") # splits each detail into items in an array
      consumer_data = {
        last_name: consumer_details[0],
        first_name: consumer_details[1],
        gender: full_gender(consumer_details[3]),
        favorite_color: consumer_details[4],
        dob: format_date(consumer_details[5])
      }
      consumer_record[:consumers].push(consumer_data)
    end
  end

  def parse_space_txt(space_txt_path)
    File.readlines(space_txt_path).each do |line|
      remove_new_line(line) # removes new line
      consumer_details = line.split(" ") # splits each detail into items in an array
      consumer_data = {
        last_name: consumer_details[0],
        first_name: consumer_details[1],
        gender: full_gender(consumer_details[3]),
        favorite_color: consumer_details[5],
        dob: format_date(consumer_details[4])
      }
      consumer_record[:consumers].push(consumer_data)
    end
  end

end
