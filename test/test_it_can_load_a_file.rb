require 'minitest/autorun'
require 'minitest/pride'
require './lib/violator'

class ViolationsTest < Minitest::Test
  def test_it_exists
    violator = Violator.new()

    assert_instance_of Violator, violator
  end

  def test_it_can_load_a_file
    violator = Violator.new()

    violator.import("data/Violations-2012.csv")

    assert violator.violations.count, 545
  end
end
