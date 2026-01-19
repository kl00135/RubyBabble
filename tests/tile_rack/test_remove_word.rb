require "minitest/autorun"
require_relative "../../tile_rack"
require_relative "../../word"

class TileRack::TestRemoveWord < Minitest::Test
  def setup
    @rack = TileRack.new
    %i[A B C A D].each { |t| @rack.append(t) }
  end

  def test_can_remove_a_word_whose_letters_are_in_order_on_the_rack
    word = @rack.remove_word("AB")
    assert_equal "AB", word.hand
    assert_equal %i[C A D], @rack.tiles
  end

  def test_can_remove_a_word_whose_letters_are_not_in_order_on_the_rack
    word = @rack.remove_word("BA")
    assert_equal "BA", word.hand
    assert_equal %i[C A D], @rack.tiles
  end

  def test_can_remove_word_with_duplicate_letters
    word = @rack.remove_word("AA")
    assert_equal "AA", word.hand
    assert_equal %i[B C D], @rack.tiles.sort
  end

  def test_can_remove_word_without_removing_unneeded_duplicate_letters
    word = @rack.remove_word("A")
    assert_equal "A", word.hand
    assert_equal %i[B C A D], @rack.tiles
  end
end