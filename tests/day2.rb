require "minitest/autorun"
require_relative "../day2/report"

class TestDay2 < Minitest::Test
  def setup
    @report = Report.new("10 9 7 5 3 1")
    @report2 = Report.new("10 4 8 7 5")
    @report3 = Report.new("3 10 4 8 7 5")
  end

  def test_that_report_is_safe
    assert_equal true, @report.safe?
  end

  def test_that_one_bad_level_is_marked_unsafe
    refute_match true, @report2.safe?
  end

  def test_that_one_bad_level_will_be_ignored_with_dampener
    assert_equal true, @report2.any_safe?
  end

  def test_that_multiple_bad_level_will_be_not_be_ignored_with_dampener
    refute_match true, @report3.any_safe?
  end

  def test_that_will_be_skipped
    skip "test this later"
  end
end
