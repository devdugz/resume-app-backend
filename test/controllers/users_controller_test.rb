require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "create" do
    assert_difference "User.count", 1 do
      post "/users.json", params: { first_name: "Test", last_name: "Test", email: "test@test.com", password: "password", password_confirmation: "password", phone_number: "123-456-7890", short_bio: "Test", linkedin_url: "Test", twitter_handle: "Test", website_url: "Test", online_resume_url: "Test", github_url: "Test", photo: "Test" }
      assert_response 201
    end
  end
end
