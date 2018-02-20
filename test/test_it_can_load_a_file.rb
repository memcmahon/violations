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

  def test_it_can_sort_violations_by_date_by_category
    violator = Violator.new()

    violator.import("data/Violations-2012.csv")

    earliest_vegetation = violator.sort_by_date("vegetation").first.date
    latest_vegetation = violator.sort_by_date("vegetation").last.date

    assert_equal earliest_vegetation, "2012-02-01 00:00:00"
    assert_equal latest_vegetation, "2012-12-05 00:00:00"
  end
end
