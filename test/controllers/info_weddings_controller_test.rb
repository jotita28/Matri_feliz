require 'test_helper'

class InfoWeddingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get info_weddings_index_url
    assert_response :success
  end

end
