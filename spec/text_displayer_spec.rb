require './bin/run.rb'

describe "Text Displayer sorts data before output to terminal" do

  let(:test_displayer) { TextDisplayer.new }
  let(:test_parser) { TextParser.new }

  test_arr = [
    {:last_name=>"Abercrombie", :first_name=>"Neil", :gender=>"Male", :favorite_color=>"Tan", :dob=>"2/13/1943"},
    {:last_name=>"Bishop", :first_name=>"Timothy", :gender=>"Male", :favorite_color=>"Yellow", :dob=>"4/23/1967"},
    {:last_name=>"Kelly", :first_name=>"Sue", :gender=>"Female", :favorite_color=>"Pink", :dob=>"7/12/1959"}
  ]

  it "output_display display method correctly puts out data to terminal" do
    $stdout = StringIO.new
    test_displayer.output_display(test_arr, "output1")
    $stdout.rewind
    expect($stdout.gets.strip).to include('Output 1:')
  end

end
