require 'test_helper'

class RemetricTest < ActiveSupport::TestCase
  test "sdfds" do
    Remetric.track description: "Awesome", user: User.last
    assert_equal 1, Remetric::Event.count
  end

  test "sdfds" do
    Remetric.track description: "Awesome", user: User.last
    assert_equal 1, Remetric::Event.count
  end
end