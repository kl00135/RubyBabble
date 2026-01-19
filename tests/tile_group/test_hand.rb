require "minitest/autorun"
require_relative "../../tile_group"

class TileGroup::TestHand < Minitest::Test
  def setup
    @group = TileGroup.new
  end

  def test_convert_empty_group_to_string
    assert_equal "", @group.hand
  end

  def test_convert_single_tile_group_to_string
    @group.append(:A)
    assert_equal "A", @group.hand
  end

  def test_convert_multi_tile_group_to_string
    @group.append(:A)
    @group.append(:B)
    @group.append(:C)
    assert_equal "ABC", @group.hand
  end

  def test_convert_multi_tile_group_with_duplicates_to_string
    @group.append(:A)
    @group.append(:A)
    @group.append(:B)
    assert_equal "AAB", @group.hand
  end
end
