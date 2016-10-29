require './lib/text_parser'

describe "Text Parser collects and reformats data from .txt files" do

  let(:test_parser) { TextParser.new }

  comma_hash = {
    :consumers=>[
      {:last_name=>"Abercrombie", :first_name=>"Neil", :gender=>"Male", :favorite_color=>"Tan", :dob=>"2/13/1943"},
      {:last_name=>"Bishop", :first_name=>"Timothy", :gender=>"Male", :favorite_color=>"Yellow", :dob=>"4/23/1967"},
      {:last_name=>"Kelly", :first_name=>"Sue", :gender=>"Female", :favorite_color=>"Pink", :dob=>"7/12/1959"}
    ]
  }

  pipe_hash = {
    :consumers=>[
      {:last_name=>"Smith", :first_name=>"Steve", :gender=>"Male", :favorite_color=>"Red", :dob=>"3/3/1985"},
      {:last_name=>"Bonk", :first_name=>"Radek", :gender=>"Male", :favorite_color=>"Green", :dob=>"6/3/1975"},
      {:last_name=>"Bouillon", :first_name=>"Francis", :gender=>"Male", :favorite_color=>"Blue", :dob=>"6/3/1975"}
    ]
  }

  space_hash = {
    :consumers=>[
      {:last_name=>"Kournikova", :first_name=>"Anna", :gender=>"Female", :favorite_color=>"Red", :dob=>"6/3/1975"},
      {:last_name=>"Hingis", :first_name=>"Martina", :gender=>"Female", :favorite_color=>"Green", :dob=>"4/2/1979"},
      {:last_name=>"Seles", :first_name=>"Monica", :gender=>"Female", :favorite_color=>"Black", :dob=>"12/2/1973"}
    ]
  }

  test_text = "Abercrombie, Neil, Male, Tan, 2/13/1943
  Bishop, Timothy, Male, Yellow, 4/23/1967
  Kelly, Sue, Female, Pink, 7/12/1959"

  it "correctly initializes with a 'consumer_record' attribute" do
    expect(test_parser.consumer_record).to eq({consumers: []})
  end

  it "remove_new_line method correctly removes newline from text" do
    expect(test_text).to include("\n")
    expect(test_parser.remove_new_line(test_text)).to_not include("\n")
  end

  it "txt_collector method correctly detects .txt files" do
    expect(test_parser.txt_collector).to eq([
      "./input_files/comma.txt",
      "./input_files/pipe.txt",
      "./input_files/space.txt"
    ])
  end

  it "determine_format_action method correctly determines format and parses comma text" do
    comma_txt_path = test_parser.txt_collector[0]
    test_parser.determine_format_action(comma_txt_path)
    expect(test_parser.consumer_record).to eq(comma_hash)
  end

  it "determine_format_action method correctly determines format and parses pipe text" do
    pipe_txt_path = test_parser.txt_collector[1]
    test_parser.determine_format_action(pipe_txt_path)
    expect(test_parser.consumer_record).to eq(pipe_hash)
  end

  it "determine_format_action method correctly determines format and parses pipe text" do
    space_txt_path = test_parser.txt_collector[2]
    test_parser.determine_format_action(space_txt_path)
    expect(test_parser.consumer_record).to eq(space_hash)
  end

  it "parse_comma_txt method correctly removes commas from text" do
    comma_txt = './spec/input_files_spec/comma_spec.txt'
    test_parser.parse_comma_txt(comma_txt)
    expect(test_parser.consumer_record).to eq(comma_hash)
  end

  it "parse_pipe_txt method correctly removes pipes from text" do
    pipe_txt = './spec/input_files_spec/pipe_spec.txt'
    test_parser.parse_pipe_txt(pipe_txt)
    expect(test_parser.consumer_record).to eq(pipe_hash)
  end

  it "parse_space_txt method correctly removes spaces from text" do
    space_txt = './spec/input_files_spec/space_spec.txt'
    test_parser.parse_space_txt(space_txt)
    expect(test_parser.consumer_record).to eq(space_hash)
  end

  it "full_gender method correctly converts gender from abbreviation" do
    female_abbr = "F"
    male_abbr = "M"
    expect(test_parser.full_gender(female_abbr)).to eq("Female")
    expect(test_parser.full_gender(male_abbr)).to eq("Male")
  end

  it "format_date method correctly converts date string" do
    test_date = "2-14-1989"
    expect(test_parser.format_date(test_date)).to eq("2/14/1989")
  end

end
