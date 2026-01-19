require "minitest/autorun"
require_relative "../../word"
require_relative "../../tile_bag"

class Word::TestScore < Minitest::Test
  def setup
    @word = Word.new
  end

  def test_empty_word_should_have_score_of_zero
    assert_equal 0, @word.score
  end

  def test_score_a_one_tile_word
    @word.append(:A)
    assert_equal 1, @word.score
  end

  def test_score_a_word_with_multiple_different_tiles
    @word.append(:A)
    @word.append(:B)
    @word.append(:C)
    assert_equal 7, @word.score
  end

  def test_score_a_word_with_recurring_tiles
    @word.append(:A)
    @word.append(:A)
    @word.append(:B)
    assert_equal 5, @word.score
  end
end