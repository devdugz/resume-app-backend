require "test_helper"

class ExperiencesControllerTest < ActionDispatch::IntegrationTest
  def setup
    super
    @experience = Experience.create!(
      start_date: "2020",
      end_date: "Present",
      job_title: "Test Job",
      company_name: "Test Company",
      details: "Test Details",
      user_id: @user.id,
    )
  end

  test "show" do
    get "/experiences/#{@experience.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "start_date", "end_date", "job_title", "company_name", "details", "created_at", "updated_at", "user_id"], data.keys
  end

  test "update" do
    patch "/experiences/#{@experience.id}.json", params: { job_title: "Updated Title" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated Title", data["job_title"]
  end

  test "destroy" do
    assert_difference "Experience.count", -1 do
      delete "/experiences/#{@experience.id}.json"
      assert_response 200
    end
  end
end
