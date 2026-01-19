require "minitest/autorun"
require_relative "../../tile_group"

class TileGroup::TestInitialize < Minitest::Test
  def test_create_empty_tile_group
    group = TileGroup.new
    assert_equal [], group.tiles
  end
end