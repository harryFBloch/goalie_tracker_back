require 'test_helper'

class GoaliesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @goaly = goalies(:one)
  end

  test "should get index" do
    get goalies_url, as: :json
    assert_response :success
  end

  test "should create goaly" do
    assert_difference('Goalie.count') do
      post goalies_url, params: { goaly: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show goaly" do
    get goaly_url(@goaly), as: :json
    assert_response :success
  end

  test "should update goaly" do
    patch goaly_url(@goaly), params: { goaly: {  } }, as: :json
    assert_response 200
  end

  test "should destroy goaly" do
    assert_difference('Goalie.count', -1) do
      delete goaly_url(@goaly), as: :json
    end

    assert_response 204
  end
end
