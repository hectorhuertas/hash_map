require 'minitest'
require 'digest'
require 'hash_map'

class HashMapTest < Minitest::Test
  def test_it_exists
    assert HashMap
  end

  def test_it_has_a_default_lenght_of_6
    hash_map = HashMap.new
    assert_equal 6, hash_map.map_lenght
  end

  def test_it_can_have_any_lenght
    hash_map = HashMap.new(4)
    assert_equal 4, hash_map.map_lenght
  end

  def test_it_indexes_at_key_hash_modulo_array_length
    hash_map = HashMap.new(6)
    input = 'key'
    # 4 is the result of pseudocode 'key'.SHA1.to_hexadecimal % 6
    index = 4
    assert_equal index, hash_map.index('key')
  end

  def test_it_sets_string_values_at_keys_index
    hash_map = HashMap.new(6)
    hash_map.set('key', 'value')
    assert_equal 'value', hash_map.map[4]
  end

  def test_it_sets_fixnum_values_at_keys_index
    hash_map = HashMap.new(6)
    hash_map.set(33, 99)
    assert_equal 99, hash_map.map[2]
  end

  def test_it_sets_several_values_at_keys_index_and_can_recover_them
    hash_map = HashMap.new(6)
    hash_map.set('key', 'value')
    assert_equal 'value', hash_map.get('key')
    hash_map.set('key3', 'value3')
    assert_equal 'value3', hash_map.get('key3')
    hash_map.set(33, 99)
    assert_equal 99, hash_map.get(33)
  end

  def test_it_handle_collisions_and_can_recover_every_data
    hash_map = HashMap.new(6)
    hash_map.set('key', 'value')
    hash_map.set('key2', 'value2')
    assert_equal 'value', hash_map.get('key')
    assert_equal 'value2', hash_map.get('key2')
  end
end
