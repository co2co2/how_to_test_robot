require 'minitest/autorun'
require 'minitest/pride'
require './robot.rb'

class TestRobot < MiniTest::Test
  #
  def test_that_foreign_robot_needing_repairs_sent_to_station_1

    # arrange
    robot = Robot.new
    robot.foreign_model = true
    robot.needs_repairs = true
    # act
    actual = robot.station
    expect = 1
    # assert
    assert_equal(expect,actual)
  end
  #
  def test_that_vintage_robot_needing_repairs_sent_to_station_2

    # arrange
    robot = Robot.new
    robot.vintage_model = true
    robot.needs_repairs = true
    # act
    actual = robot.station
    expect = 2
    # assert
    assert_equal(expect,actual)
  end
  #
  def test_that_standard_robot_needing_repairs_sent_to_station_3

    # arrange
    robot = Robot.new
    robot.vintage_model = false
    robot.needs_repairs = false
    robot.needs_repairs = true
    # act
    actual = robot.station
    expect = 3
    # assert
    assert_equal(expect,actual)

  end
  #
  def test_that_robot_in_good_condition_sent_to_station_4
    # arrange
    robot = Robot.new
    robot.needs_repairs = false
    # act
    actual = robot.station
    expect = 4
    # assert
    assert_equal(expect,actual)
  end
  #
  def test_prioritize_tasks_with_empty_todo_list_returns_negative_one

    # arrange
    robot = Robot.new
    robot.todos = []
    # act
    actual = robot.prioritize_tasks
    expect = -1
    # assert
    assert_equal(expect,actual)

  end

  def test_prioritize_tasks_with_todos_returns_max_todo_value
  #
    # arrange
    robot = Robot.new
    robot.todos =[ 9, 13, 1]
    # act
    actual = robot.prioritize_tasks
    expect = 13
    # assert
    assert_equal(expect,actual)
  end

  def test_workday_on_day_off_returns_false

    # arrange
    robot = Robot.new
    robot.day_off = "sunday"
    # act
    actual = robot.workday?("sunday")
    expect = false
    # assert
    assert_equal(actual,expect)
  end

  def test_workday_not_day_off_returns_true

    # arrange
    robot = Robot.new
    robot.day_off = "sunday"
    # act
    actual = robot.workday?("monday")
    expect = true

    # assert
    assert_equal(actual,expect)
  end

end
