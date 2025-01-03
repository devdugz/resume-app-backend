require "test_helper"

class EducationsControllerTest < ActionDispatch::IntegrationTest
  def setup
    super
    @education = Education.create!(
      start_date: "2020",
      end_date: "2024",
      degree: "BS",
      university_name: "Test University",
      details: "Test Details",
      user_id: @user.id,
    )
  end

  test "should show education" do
    get "/educations/#{@education.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "start_date", "end_date", "degree", "university_name", "details", "created_at", "updated_at", "user_id"], data.keys
  end
end
