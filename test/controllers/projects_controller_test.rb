require "test_helper"

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  def setup
    super
    @project = Project.create!(
      name: "Test Project",
      description: "Test Description",
      url: "test.com",
      screenshot: "test.jpg",
      user_id: @user.id,
    )
  end

  test "show" do
    get "/projects/#{@project.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "name", "description", "url", "screenshot", "created_at", "updated_at", "user_id"], data.keys
  end

  test "update" do
    patch "/projects/#{@project.id}.json", params: { name: "Updated Project" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated Project", data["name"]
  end

  test "destroy" do
    assert_difference "Project.count", -1 do
      delete "/projects/#{@project.id}.json"
      assert_response 200
    end
  end
end
