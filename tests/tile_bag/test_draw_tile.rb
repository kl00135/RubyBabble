require "minitest/autorun"
require_relative "../../tile_bag"

class TileBag::TestDrawTile < Minitest::Test
  def setup
    @bag = TileBag.new
  end

  def test_has_proper_number_of_tiles
    drawn_tiles = []

    until @bag.empty?
      drawn_tiles << @bag.draw_tile
    end

    assert_equal 98, drawn_tiles.size
    assert @bag.empty?
  end

  def test_has_proper_tile_distribution
    counts = Hash.new(0)

    until @bag.empty?
      tile = @bag.draw_tile
      counts[tile] += 1
    end

    assert_equal 9,  counts[:A]
    assert_equal 2,  counts[:B]
    assert_equal 2,  counts[:C]
    assert_equal 4,  counts[:D]
    assert_equal 12, counts[:E]
    assert_equal 2,  counts[:F]
    assert_equal 3,  counts[:G]
    assert_equal 2,  counts[:H]
    assert_equal 9,  counts[:I]
    assert_equal 1,  counts[:J]
    assert_equal 1,  counts[:K]
    assert_equal 4,  counts[:L]
    assert_equal 2,  counts[:M]
    assert_equal 6,  counts[:N]
    assert_equal 8,  counts[:O]
    assert_equal 2,  counts[:P]
    assert_equal 1,  counts[:Q]
    assert_equal 6,  counts[:R]
    assert_equal 4,  counts[:S]
    assert_equal 6,  counts[:T]
    assert_equal 4,  counts[:U]
    assert_equal 2,  counts[:V]
    assert_equal 2,  counts[:W]
    assert_equal 1,  counts[:X]
    assert_equal 2,  counts[:Y]
    assert_equal 1,  counts[:Z]
  end
end