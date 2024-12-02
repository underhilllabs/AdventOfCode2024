require "minitest/autorun"
require_relative "../day2/report"

class TestDay2 < Minitest::Test
  def setup
    @safe_report = Report.new("10 9 7 5 3 1")
    @one_bad_level_report = Report.new("10 4 8 7 5")
    @multiple_bad_report = Report.new("3 10 4 8 7 5")
  end

  def test_that_safe_report_is_safe
    assert_equal true, @safe_report.safe?
  end

  def test_that_one_bad_level_is_marked_unsafe
    refute_match true, @one_bad_level_report.safe?
  end

  def test_that_one_bad_level_will_be_ignored_with_dampener
    assert_equal true, @one_bad_level_report.any_safe?
  end

  def test_that_multiple_bad_level_will_be_not_be_ignored_with_dampener
    refute_match true, @multiple_bad_report.any_safe?
  end

  def test_that_will_be_skipped
    skip "test this later"
  end
end
