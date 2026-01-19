require_relative "tile_bag"
require_relative "tile_rack"
require_relative "word"
require "spellchecker"
require "tempfile"

class Babble
  def initialize
    @bag = TileBag.new
    @rack = TileRack.new
    @total_score = 0

    replenish_rack
  end

  def run
    until @bag.empty?
      puts "Tiles: #{@rack.hand}"
      print "Enter a word from the selected hand, or type ':quit' if done playing."
      input = gets.chomp.upcase

      if input == ":QUIT"
        puts "Thanks for playing, total score: #{@total_score}"
        return
      end

      unless Spellchecker::check(input)[0][:correct]
        puts "Not a valid word"
        puts "Total score: #{@total_score}"
        next
      end

      unless @rack.has_tiles_for?(input)
        puts "Not enough tiles"
        puts "Total score: #{@total_score}"
        next
      end

      word = @rack.remove_word(input)
      score = word.score
      @total_score += score

      puts "You made #{input} for #{score} points"
      puts "Total score: #{@total_score}"

      replenish_rack
    end

    puts "Thanks for playing, total score: #{@total_score}"
  end

  private

  def replenish_rack
    @rack.number_of_tiles_needed.times do
      break if @bag.empty?
      @rack.append(@bag.draw_tile)
    end
  end
end

Babble.new.run