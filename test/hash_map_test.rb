require 'minitest'
require 'hash_map'

class HashMapTest < Minitest::Test
  def test_it_exists
    assert HashMap
  end

  def test_it_has_a_default_lenght_of_6
    hash_map = HashMap.new
    assert_equal 6 , hash_map.map_lenght
  end

  def test_it_can_have_any_lenght
    hash_map = HashMap.new(4)
    assert_equal 4 , hash_map.map_lenght
  end

end
