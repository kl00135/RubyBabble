require_relative "tile_group"

class TileRack < TileGroup
  def initialize
    super
  end

  def number_of_tiles_needed
    7 - @tiles.length
  end

  def has_tiles_for?(text)
    needed = Hash.new(0)
    text.each_char { |c| needed[c.to_sym] += 1 }

    available = Hash.new(0)
    @tiles.each { |t| available[t] += 1 }

    needed.all? do |tile, count|
      available[tile] >= count
    end
  end

    def remove_word(text)
    word = Word.new

    text.each_char do |c|
      tile = c.to_sym
      remove(tile)
      word.append(tile)
    end
    word
  end

end