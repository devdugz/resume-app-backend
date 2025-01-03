require "test_helper"

class SkillsControllerTest < ActionDispatch::IntegrationTest
  def setup
    super
    @skill = Skill.create!(
      skill_name: "Test Skill",
      user_id: @user.id,
    )
  end

  test "index" do
    get "/skills.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Skill.count, data.length
  end

  test "create" do
    assert_difference "Skill.count", 1 do
      post "/skills.json", params: { skill_name: "New Skill" }
      assert_response 200
    end
  end

  test "show" do
    get "/skills/#{@skill.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "skill_name", "created_at", "updated_at", "user_id"], data.keys
  end

  test "update" do
    patch "/skills/#{@skill.id}.json", params: { skill_name: "Updated Skill" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated Skill", data["skill_name"]
  end

  test "destroy" do
    assert_difference "Skill.count", -1 do
      delete "/skills/#{@skill.id}.json"
      assert_response 200
    end
  end
end
