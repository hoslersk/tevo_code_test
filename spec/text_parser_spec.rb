require './lib/text_parser'

describe "Text Parser collects and reformats data from .txt files" do

  let(:test_parser) { TextParser.new }

  it "Removes commas from text" do
    comma_txt = './spec/input_files_spec/comma_spec.txt'
    test_parser.parse_comma_txt(comma_txt)
    expect(test_parser.consumer_record).to eq({:consumers=>[{:last_name=>"Abercrombie", :first_name=>"Neil", :gender=>"Male", :favorite_color=>"Tan", :dob=>"2/13/1943"}, {:last_name=>"Bishop", :first_name=>"Timothy", :gender=>"Male", :favorite_color=>"Yellow", :dob=>"4/23/1967"}, {:last_name=>"Kelly", :first_name=>"Sue", :gender=>"Female", :favorite_color=>"Pink", :dob=>"7/12/1959"}]})
  end
  it "Removes pipes from text" do
    pipe_txt = './spec/input_files_spec/pipe_spec.txt'
    test_parser.parse_pipe_txt(pipe_txt)
    expect(test_parser.consumer_record).to eq({:consumers=>[{:last_name=>"Smith", :first_name=>"Steve", :gender=>"Male", :favorite_color=>"Red", :dob=>"3/3/1985"}, {:last_name=>"Bonk", :first_name=>"Radek", :gender=>"Male", :favorite_color=>"Green", :dob=>"6/3/1975"}, {:last_name=>"Bouillon", :first_name=>"Francis", :gender=>"Male", :favorite_color=>"Blue", :dob=>"6/3/1975"}]})
  end
  it "Removes spaces from text" do
    space_txt = './spec/input_files_spec/space_spec.txt'
    test_parser.parse_space_txt(space_txt)
    expect(test_parser.consumer_record).to eq({:consumers=>[{:last_name=>"Kournikova", :first_name=>"Anna", :gender=>"Female", :favorite_color=>"Red", :dob=>"6/3/1975"}, {:last_name=>"Hingis", :first_name=>"Martina", :gender=>"Female", :favorite_color=>"Green", :dob=>"4/2/1979"}, {:last_name=>"Seles", :first_name=>"Monica", :gender=>"Female", :favorite_color=>"Black", :dob=>"12/2/1973"}]})
  end

end
