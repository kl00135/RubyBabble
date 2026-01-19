require "minitest/autorun"
require_relative "../../tile_rack"

class TileRack::TestHasTilesFor < Minitest::Test
  def setup
    @rack = TileRack.new
    %i[A B C D E F G].each { |t| @rack.append(t) }
  end

  def test_rack_has_needed_letters_when_letters_are_in_order_no_duplicates
    assert @rack.has_tiles_for?("ABC")
  end

  def test_rack_has_needed_letters_when_letters_are_not_in_order_no_duplicates
    assert @rack.has_tiles_for?("CBA")
  end

  def test_rack_doesnt_contain_any_needed_letters
    refute @rack.has_tiles_for?("XYZ")
  end

  def test_rack_contains_some_but_not_all_needed_letters
    refute @rack.has_tiles_for?("ABZ")
  end

  def test_rack_contains_a_word_with_duplicate_letters
    @rack.append(:A)
    assert @rack.has_tiles_for?("AA")
  end

  def test_rack_doesnt_contain_enough_duplicate_letters
    refute @rack.has_tiles_for?("AAA")
  end
end