require "minitest/autorun"
require_relative "../../tile_rack"

class TileRack::TestNumberOfTilesNeeded < Minitest::Test
  def setup
    @rack = TileRack.new
  end

  def test_empty_tile_rack_should_need_max_tiles
    assert_equal 7, @rack.number_of_tiles_needed
  end

  def test_tile_rack_with_one_tile_should_need_max_minus_one_tiles
    @rack.append(:A)
    assert_equal 6, @rack.number_of_tiles_needed
  end

  def test_tile_rack_with_several_tiles_should_need_some_tiles
    @rack.append(:A)
    @rack.append(:B)
    @rack.append(:C)
    assert_equal 4, @rack.number_of_tiles_needed
  end

  def test_that_full_tile_rack_doesnt_need_any_tiles
    %i[A B C D E F G].each { |t| @rack.append(t) }
    assert_equal 0, @rack.number_of_tiles_needed
  end
end