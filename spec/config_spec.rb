require File.join(File.dirname(__FILE__), %w[spec_helper])

describe Nom::Config do
  before(:each) do
    @default_file = File.expand_path(File.join(File.dirname(__FILE__), "..", "lib", Nom::Config::FILE_NAME))
    @home_file = File.expand_path(File.join("~", Nom::Config::FILE_NAME))
  end

  it 'should read options from default file in lib/' do
    mock(File).exists?(@default_file) { true }
    mock(File).exists?(@home_file)    { false }

    mock(IO).read(@default_file) { "base: ausnom.com" }

    config = Nom::Config.new
    config[:base].should == 'ausnom.com'
  end

  it 'should prefer options specified in home dir .nom' do
    mock(File).exists?(@default_file) { true }
    mock(File).exists?(@home_file)    { true }

    mock(IO).read(@default_file) { "base: ausnom.com" }
    mock(IO).read(@home_file)    { "base: ausnom.localhost" }

    config = Nom::Config.new
    config[:base].should == 'ausnom.localhost'
  end
end
