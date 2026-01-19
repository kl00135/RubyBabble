require_relative "tile_group"
require_relative "tile_bag"

class Word < TileGroup
    def initialize
        super
    end

    def score
        @tiles.sum { |tile| TileBag.points_for(tile) }
    end
end