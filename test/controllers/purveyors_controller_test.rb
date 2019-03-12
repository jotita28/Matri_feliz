require 'test_helper'

class PurveyorsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get purveyors_show_url
    assert_response :success
  end

end
