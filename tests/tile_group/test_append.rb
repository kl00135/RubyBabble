require "minitest/autorun"
require_relative "../../tile_group"

class TileGroup::TestAppend < Minitest::Test
  def setup
    @group = TileGroup.new
  end

  def test_append_one_tile
    @group.append(:A)
    assert_equal [:A], @group.tiles
  end

  def test_append_many_tiles
    @group.append(:A)
    @group.append(:B)
    @group.append(:C)
    assert_equal [:A, :B, :C], @group.tiles
  end

  def test_append_duplicate_tiles
    @group.append(:A)
    @group.append(:A)
    assert_equal [:A, :A], @group.tiles
  end
end
