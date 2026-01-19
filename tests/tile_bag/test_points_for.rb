require "minitest/autorun"
require_relative "../../tile_bag"

class TileBag::TestPointsFor < Minitest::Test
  def test_confirm_point_values
    one_point_tiles   = [:A, :E, :I, :O, :U, :L, :N, :S, :T, :R]
    two_point_tiles   = [:D, :G]
    three_point_tiles = [:B, :C, :M, :P]
    four_point_tiles  = [:F, :H, :V, :W, :Y]
    five_point_tiles  = [:K]
    eight_point_tiles = [:J, :X]
    ten_point_tiles   = [:Q, :Z]

    one_point_tiles.each   { |tile| assert_equal 1,  TileBag.points_for(tile) }
    two_point_tiles.each   { |tile| assert_equal 2,  TileBag.points_for(tile) }
    three_point_tiles.each { |tile| assert_equal 3,  TileBag.points_for(tile) }
    four_point_tiles.each  { |tile| assert_equal 4,  TileBag.points_for(tile) }
    five_point_tiles.each  { |tile| assert_equal 5,  TileBag.points_for(tile) }
    eight_point_tiles.each { |tile| assert_equal 8,  TileBag.points_for(tile) }
    ten_point_tiles.each   { |tile| assert_equal 10, TileBag.points_for(tile) }
  end
end