class BeNumbered
  def initialize(number)
    @number = number
  end

  def matches?(line)
    @line = line
    @line.split(':').first.to_i == @number
  end

  def failure_message
   " expected line to start with #{@number}: \"#{@line.chomp}\""
  end
end

def be_numbered(i)
  BeNumbered.new(i)
end
