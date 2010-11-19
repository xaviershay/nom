require File.join(File.dirname(__FILE__), %w[spec_helper])

describe Nom, 'integration specs' do
  shared_examples_for "a search listing" do
    it 'shows at least one result' do
      @output.lines.to_a.size.should >= 1
    end

    it 'numbers each line' do
      @output.lines.each_with_index do |line, i|
        line.should be_numbered(i + 1)
      end
    end

    it 'shows only results that contain the word searched for' do
      @output.lines.each_with_index do |line, i|
        line.should =~ /#{@food}/i
      end
    end
  end

  describe 'nom Tofu' do
    before(:all) do
      @food = "Tofu"
      @output = `nom #{@food}`
    end

    it_should_behave_like "a search listing"
  end


  describe 'nom Peanut Butter' do
    before(:all) do
      @food = "Peanut Butter"
      @output = `nom #{@food}`
    end

    it_should_behave_like "a search listing"
  end



  shared_examples_for 'a food detail listing' do
    it 'shows one product containing the word searched for' do
      @output.lines.first.should =~ /#{@food}/i
    end

    Nom::Config.new[:nutrients].each do |nutrient|
      it "shows the #{nutrient} measure for that product" do
        @output.should =~ /Energy\s+\d+(\.\d+)?/
      end
    end
  end

  describe 'nom Tofu 2' do
    before(:all) do
      @food = "Tofu"
      @output = `nom #{@food} 2`
    end
    
    it_should_behave_like "a food detail listing"
  end

  describe 'nom Peanut Butter 2' do
    before(:all) do
      @food = "Peanut Butter"
      @output = `nom #{@food} 2`
    end
    
    it_should_behave_like "a food detail listing"
  end
end
