require 'test_helper'

class StatsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get stats for actor" do
    get(:for_user, { 'id' => 'maikeru' })
    assert_response :success
  end

end
