=begin

Play a game of Tic Tac Toe by invoking Ttt.ttt

=end

class Ttt
  @grid = [[' ',' ',' '],[' ',' ',' '],[' ',' ',' ']]
  @user_choice = ''
  @computer_choice = ['','']

  def self.show_grid
    print " #{@grid[0][0]} | #{@grid[0][1]} | #{@grid[0][2]}   0: 0,1,2"
    print "\n-----------\n"
    print " #{@grid[1][0]} | #{@grid[1][1]} | #{@grid[1][2]}   1: 0,1,2"
    print "\n-----------\n"
    print " #{@grid[2][0]} | #{@grid[2][1]} | #{@grid[2][2]}   2: 0,1,2"
    print "\n\n"
  end

  def self.validate_choice(x, y)
    if @grid[x][y] == ' '
      return true
    else
      return false
    end
  end

  def self.game_over?
    #Check Horizontals and Verticals
    (0..2).each do |x|
      if @grid[x][0] == 'x' && @grid[x][1] == 'x' &&@grid[x][2] == 'x' 
        puts "You Win!"
        return true
      end
      if @grid[0][x] == 'x' && @grid[1][x] == 'x' &&@grid[2][x] == 'x' 
        puts "You Win!"
        return true
      end

      if @grid[x][0] == 'o' && @grid[x][2] == 'o' &&@grid[x][2] == 'o' 
        puts "The Computer Wins!"
        return true
      end
      if @grid[0][x] == 'o' && @grid[1][x] == 'o' &&@grid[2][x] == 'o' 
        puts "The Computer Wins!"
        return true
      end
    end

    # Check diagonals
    if @grid[0][0] == 'x' && @grid[1][1] == 'x' && @grid[2][2] == 'x'
      puts "You Win!"
      return true
    end
    if @grid[0][2] == 'x' && @grid[1][1] == 'x' && @grid[2][0] == 'x'
      puts "You Win!"
      return true
    end

    if @grid[0][0] == 'o' && @grid[1][1] == 'o' && @grid[2][2] == 'o'
      puts "The Computer Wins!"
      return true
    end
    if @grid[0][2] == 'o' && @grid[1][1] == 'o' && @grid[2][0] == 'o'
      puts "The Computer Wins!"
      return true
    end

    return false
  end

  def self.ttt
    self.show_grid
    
    # Get user play
    print "Enter your choice: "
    @user_choice = gets.chomp

    if self.validate_choice(@user_choice.split(' ')[0].to_i, @user_choice.split(' ')[1].to_i)
      @grid[@user_choice.split(' ')[0].to_i][@user_choice.split(' ')[1].to_i] = 'x'
    else
      puts "Not a valid choice. Try again."
      self.ttt
    end

    # Make computer choose
    @computer_choice[0] = rand(0..2)
    @computer_choice[1] = rand(0..2)
    until self.validate_choice(@computer_choice[0], @computer_choice[1])
      @computer_choice[0] = rand(0..2)
      @computer_choice[1] = rand(0..2)
    end
    @grid[@computer_choice[0]][@computer_choice[1]] = 'o'
    
    # Check for win
    if self.game_over?
      puts "Victory condition reached."
      return
    end
    
    # Keep going
    self.ttt
  end
end
