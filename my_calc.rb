=begin

The mycalc class is called with mycalc.calculator and provides the user with a
prompt to perform basic arithmetic functions with a single operator.

=end

class Mycalc
  @user_input = nil
  @operator = nil
  @values = nil
  @saved = nil

  def self.get_op(input)
    op = []

    op = input.scan(%r{[\+\/*^]})
    if op.length < 1
      op = input.scan(%r{[-]})
    end
    
    if input.include?"sqrt"
      return ["sqrt"]
    elsif input.include?"ln"
      return ["ln"]
    elsif input.include?"log"
      return ["log"]
    end

    return op
  end

  # This function is not currently used
  def self.get_values(input)
    return nil
  end

  def self.calc
    case @operator
    when "+"
      return @values[0] + @values[1]
    when "-"
      return @values[0] - @values[1]
    when "*"
      return @values[0] * @values[1]
    when "/"
      if not @values[1] == 0
        return @values[0] / @values[1]
      else
        put "Error: division by zero not allowed"
        return nil
      end
    when "^"
      return @values[0] ** @values[1]
    when "sqrt"
      return Math.sqrt @values[1]
    when "ln"
      return Math.log @values[1]
    when "log"
      return Math.log10 @values[1]
    end
    return nil
  end

  def self.calculator
    system("clear")
    print "Enter a single operator statement using (+,-,/,*,^,sqrt,ln,log) or
type quit.\n\n"
    puts "Last result: #{@result}"
    puts

    @user_input = gets.chomp.gsub(%r{\s+},"")
    if @user_input.downcase == "quit"
      return
    end

    @operator = self.get_op(@user_input)

    if not @operator.length == 1
      puts "Error: input must contain 1 and only 1 operator"
      return
    end
    @operator = @operator[0]

    @values = @user_input.split(@operator)
    if @values.length > 0
      (0..@values.length).each do |x|
        @values[x] = @values[x].to_f
      end
    else
      puts "Error: no operands"
      return
    end
    
    @result = self.calc
    puts @result
    puts

    self.calculator
  end
end
