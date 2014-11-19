=begin
This class allows a user to play a number of Rock, Paper, Sissors
games against the computer.

Usage:  Rps.rps([number of games to play]) - start game
        Rps.help - get help
=end

class Rps
  @score = {"Wins" => 0, "Losses" => 0}
  @player_choices = {'r' => "Rock", 'p' => "Paper", 's' => "Sissors"}
  @computer_choices = {0 => "Rock", 1 => "Paper", 2 => "Sissors"}
  @computer_choice = 0
  @player_choice = 0

  def self.win
    puts "You win!"
    @score["Wins"] += 1
    @game_counter += 1
  end

  def self.lose
    puts "You lose!"
    @score["Losses"] += 1
    @game_counter += 1
  end

  def self.tie
    puts "Tie."
  end

  def self.rps(games_to_play=3)
    @game_counter = 0
    @score = {"Wins" => 0, "Losses" => 0}

    while @game_counter < games_to_play do
      # computer choice mapping: 0:rock, 1:paper, 2:sissors
      @computer_choice = rand(0..2)

      puts "Pick Rock(r), Paper(p), or Sissors(s):"
      @player_choice = gets.chomp.downcase

      puts "You picked: #{@player_choices[@player_choice]}"
      puts "Computer picked: #{@computer_choices[@computer_choice]}"

      case @player_choice
      when 'r'
        case @computer_choice
        when 0
          self.tie
        when 1
          self.lose
        else
          self.win
        end
      when 'p'
        case @computer_choice
        when 0
          self.win
        when 1
          self.tie
        else
          self.lose
        end
      when 's'
        case @computer_choice
        when 0
          lose
        when 1
          win
        else
          tie
        end
      else
        puts "\nPlease enter r, p, or s.\n\n"
        redo
      end

      puts @score
    end
    
    if @score["Wins"] > @score["Losses"]
      puts "Congratulations! You beat chance!"
    else
      puts "Better luck next time."
    end
  end

  def self.help
    puts "\nCall the method rps with the number of games you wish to play as an optional parameter. (Default: 3)\n\n"
  end
end
