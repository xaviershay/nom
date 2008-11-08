require File.join(File.dirname(__FILE__), %w[spec_helper])

describe Nom, 'integration specs' do
  describe 'nom Tofu' do
    before(:all) do
      @output = `nom Tofu`
    end

    it 'shows at least one result' do
      @output.to_a.size.should >= 1
    end

    it 'numbers each line' do
      @output.each_with_index do |line, i|
        line.should be_numbered(i + 1)
      end
    end

    it 'shows only results that contain the word "Tofu"' do
      @output.each_with_index do |line, i|
        line.should =~ /Tofu/
      end
    end
  end

  describe 'nom Tofu 2' do
    before(:all) do
      @output = `nom Tofu 2`
    end

    it 'shows one product containing the word "Tofu"' do
      @output.to_a.first.should =~ /Tofu/
    end

    it 'shows the Energy measure in KJ for that product' do
      @output.should =~ /Energy\s+\d+(\.\d+)?KJ/
    end

    it 'shows the Protein measure in G for that product' do
      @output.should =~ /Protein\s+\d+(\.\d+)?G/
    end
  end
end

# EOF
