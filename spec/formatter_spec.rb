require File.join(File.dirname(__FILE__), %w[spec_helper])

describe Nom::Config do
  describe '#print_one' do
    def capture_stdout
      old = $stdout
      $stdout = StringIO.new(output = "")
      begin
        yield
      ensure
        $stdout = old
      end
      output
    end

    def nutrient(*values)    
      Hash[*["description", "value", "scale"].zip(values).flatten]
    end

    def food(extra = {})
      {
        "name"          => "Tofu",
        "all_nutrients" => [
          nutrient(*%w(Energy 751.0 KJ)),
          nutrient(*%w(Protein 17.3 G))
        ]
      }.merge(extra)
    end

    it 'prints the name of the food as the first line' do
      output = capture_stdout do
        Nom::Formatter.new.print_one(food("name" => "Tofu"))
      end
      output.to_a.first.should == "Tofu\n"
    end

    it 'prints a line for each nutrient specified in the config file' do
      formatter = Nom::Formatter.new
      mock(formatter).config {{ :nutrients => ["Energy", "Protein"] }}

      output = capture_stdout do
        formatter.print_one(food(
          "all_nutrients" => [
            nutrient(*%w(Energy 751.0 KJ)),
            nutrient(*%w(Protein 17.3 G))
          ]
        ))
      end
      lines = output.to_a
      lines[1].should == "Energy     751.0KJ\n"
      lines[2].should == "Protein    17.3G\n"
    end

    it 'ignores nutrients specified in the config file that do not exist for the food' do
      formatter = Nom::Formatter.new
      mock(formatter).config {{ :nutrients => ["Bogus"] }}

      output = capture_stdout do
        formatter.print_one(food())
      end
      output.should_not =~ /Bogus/
    end
  end
end
