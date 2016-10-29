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

  # it "output1 method correctly sorts data" do
  #   [{:last_name=>"Hingis", :first_name=>"Martina", :gender=>"Female", :favorite_color=>"Green", :dob=>"4/2/1979"},
  #   {:last_name=>"Kelly", :first_name=>"Sue", :gender=>"Female", :favorite_color=>"Pink", :dob=>"7/12/1959"},
  #   {:last_name=>"Kournikova", :first_name=>"Anna", :gender=>"Female", :favorite_color=>"Red", :dob=>"6/3/1975"},
  #   {:last_name=>"Seles", :first_name=>"Monica", :gender=>"Female", :favorite_color=>"Black", :dob=>"12/2/1973"},
  #   {:last_name=>"Abercrombie", :first_name=>"Neil", :gender=>"Male", :favorite_color=>"Tan", :dob=>"2/13/1943"},
  #   {:last_name=>"Bishop", :first_name=>"Timothy", :gender=>"Male", :favorite_color=>"Yellow", :dob=>"4/23/1967"},
  #   {:last_name=>"Bonk", :first_name=>"Radek", :gender=>"Male", :favorite_color=>"Green", :dob=>"6/3/1975"},
  #   {:last_name=>"Bouillon", :first_name=>"Francis", :gender=>"Male", :favorite_color=>"Blue", :dob=>"6/3/1975"},
  #   {:last_name=>"Smith", :first_name=>"Steve", :gender=>"Male", :favorite_color=>"Red", :dob=>"3/3/1985"}]
  #   $stdout1 = StringIO.new
  #   test_parser.omni_parser
  #   test_displayer.output1(test_parser)
  #   $stdout1.rewind
  #   expect($stdout1.gets.strip).to eq("Output 1:
  #     Hingis Martina Female 4/2/1979 Green
  #     Kelly Sue Female 7/12/1959 Pink
  #     Kournikova Anna Female 6/3/1975 Red
  #     Seles Monica Female 12/2/1973 Black
  #     Abercrombie Neil Male 2/13/1943 Tan
  #     Bishop Timothy Male 4/23/1967 Yellow
  #     Bonk Radek Male 6/3/1975 Green
  #     Bouillon Francis Male 6/3/1975 Blue
  #     Smith Steve Male 3/3/1985 Red
  #
  #   ")
  #
  # end

  # it "output2 method correctly sorts data"
  # it "output3 method correctly sorts data"

end
