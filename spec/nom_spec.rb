require File.join(File.dirname(__FILE__), %w[spec_helper])

describe Nom, 'integration specs' do
  describe "a search listing", :shared => true do
    it 'shows at least one result' do
      @output.to_a.size.should >= 1
    end

    it 'numbers each line' do
      @output.each_with_index do |line, i|
        line.should be_numbered(i + 1)
      end
    end

    it 'shows only results that contain the word searched for' do
      @output.each_with_index do |line, i|
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

  describe 'a food detail listing', :shared => true do
    it 'shows one product containing the word searched for' do
      @output.to_a.first.should =~ /#{@food}/i
    end

    it 'shows the Energy measure in KJ for that product' do
      @output.should =~ /Energy\s+\d+(\.\d+)?KJ/
    end

    it 'shows the Protein measure in G for that product' do
      @output.should =~ /Protein\s+\d+(\.\d+)?G/
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

# EOF
