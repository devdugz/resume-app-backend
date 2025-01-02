require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "create" do
    post "/users.json", params: { first_name: "Test", last_name: "Test", email: "test@test.com", password: "password", password_confirmation: "password", phone_number: "123-456-7890", short_bio: "Test", linkedin_url: "Test", twitter_handle: "Test", website_url: "Test", online_resume_url: "Test", github_url: "Test", photo: "Test" }
    post "/sessions.json", params: { email: "test@test.com", password: "password" }
    assert_response 201

    data = JSON.parse(response.body)
    assert_equal ["email", "user_id"], data.keys
  end

  test "destroy" do
    delete "/sessions.json"
    assert_response 200
  end
end
