require 'minitest/autorun'
require 'minitest/pride'
require './lib/violations'

class ViolationsTest < Minitest::Test
  def test_it_exists
    violator = Violations.new()

    assert_instance_of Violations, violator
  end
end
