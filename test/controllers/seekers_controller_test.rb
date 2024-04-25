require "test_helper"

class SeekersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @seeker = seekers(:one)
  end

  test "should get index" do
    get seekers_url, as: :json
    assert_response :success
  end

  test "should create seeker" do
    assert_difference("Seeker.count") do
      post seekers_url, params: { seeker: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show seeker" do
    get seeker_url(@seeker), as: :json
    assert_response :success
  end

  test "should update seeker" do
    patch seeker_url(@seeker), params: { seeker: {  } }, as: :json
    assert_response :success
  end

  test "should destroy seeker" do
    assert_difference("Seeker.count", -1) do
      delete seeker_url(@seeker), as: :json
    end

    assert_response :no_content
  end
end
