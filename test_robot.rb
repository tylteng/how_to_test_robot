require 'minitest/autorun'
require 'minitest/pride'
require './robot.rb'

class TestRobot < MiniTest::Test

  def test_that_foreign_robot_needing_repairs_sent_to_station_1
    # arrange
    r = Robot.new
    r.needs_repairs=(true)
    r.foreign_model=(true)
    # act
    expect = 1
    actual = r.station
    # assert
    assert_equal(expect, actual)
  end

  def test_that_vintage_robot_needing_repairs_sent_to_station_2
    # arrange
    r = Robot.new
    r.needs_repairs=(true)
    r.vintage_model=(true)
    # act
    expect = 2
    actual = r.station
    # assert
    assert_equal(expect, actual)
  end

  def test_that_standard_robot_needing_repairs_sent_to_station_3
    # arrange
    r = Robot.new
    r.needs_repairs=(true)
    # act
    expect = 3
    actual = r.station
    # assert
    assert_equal(expect, actual)
  end

  def test_that_robot_in_good_condition_sent_to_station_4
    # arrange
    r = Robot.new
    # act
    expect = 4
    actual = r.station
    # assert
    assert_equal(expect, actual)
  end

  def test_prioritize_tasks_with_empty_todo_list_returns_negative_one
    # arrange
    r = Robot.new
    # act
    expect = -1
    actual = r.prioritize_tasks
    # assert
    assert_equal(expect, actual)
  end

  def test_prioritize_tasks_with_todos_returns_max_todo_value
    # arrange
    r = Robot.new
    r.todos = [1, 2, 3]
    # act
    expect = r.todos.max
    actual = r.prioritize_tasks
    # assert
    assert_equal(expect, actual)
  end

  def test_workday_on_day_off_returns_false
    # arrange
    r = Robot.new
    r.day_off=("tomorrow")
    # act
    expected = false
    actual = r.workday?("tomorrow")
    # assert
    assert_equal(expected, actual)
  end

  def test_workday_not_day_off_returns_true
    r = Robot.new
    r.day_off=("tomorrow")
    # act
    expected = true
    actual = r.workday?("today")
    # assert
    assert_equal(expected, actual)
  end

end
