require('minitest/autorun')
require_relative('../models/shoe')

class TestShoe < Minitest::Test

  def setup
    options = {
      "name" => "Andrew",
      "address" => "123 street",
      "type" => "trainer",
      "size" => 9,
     
    }
    @shoe = Shoe.new(options)
  end

  def test_name
    assert_equal("Andrew", @shoe.name)
  end

  def test_address
    assert_equal("123 street", @shoe.address)
  end

  def test_type
    assert_equal("trainer", @shoe.type)
  end

  def test_size
    assert_equal(9, @shoe.size)
  end




end