require "minitest/autorun"
require_relative "../../tile_group"

class TileGroup::TestRemove < Minitest::Test
  def setup
    @group = TileGroup.new
  end

  def test_remove_only_tile
    @group.append(:A)
    @group.remove(:A)
    assert_equal [], @group.tiles
  end

  def test_remove_first_tile_from_many
    @group.append(:A)
    @group.append(:B)
    @group.append(:C)
    @group.remove(:A)
    assert_equal [:B, :C], @group.tiles
  end

  def test_remove_last_tile_from_many
    @group.append(:A)
    @group.append(:B)
    @group.append(:C)
    @group.remove(:C)
    assert_equal [:A, :B], @group.tiles
  end

  def test_remove_middle_tile_from_many
    @group.append(:A)
    @group.append(:B)
    @group.append(:C)
    @group.remove(:B)
    assert_equal [:A, :C], @group.tiles
  end

  def test_remove_multiple_tiles
    @group.append(:A)
    @group.append(:A)
    @group.remove(:A)
    @group.remove(:A)
    assert_equal [], @group.tiles
  end

  def test_make_sure_duplicates_are_not_removed
    @group.append(:A)
    @group.append(:A)
    @group.append(:B)
    @group.remove(:A)
    assert_equal [:A, :B], @group.tiles
  end
end