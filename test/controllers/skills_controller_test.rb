require "test_helper"

class SkillsControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/skills.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Skill.count, data.length
  end

  test "create" do
    assert_difference "Skill.count", 1 do
      post "/skills.json"
      assert_response 200
    end

    test "show" do
      get "/skills/#{Skill.first.id}.json"
      assert_response 200

      data = JSON.parse(response.body)
      assert_equal ["id", "name", "created_at", "updated_at"], data.keys
    end

    test "update" do
      skill = Skill.first
      patch "/skills/#{photo.id}.json", params: { name: "Updated name" }
      assert_response 200

      data = JSON.parse(response.body)
      assert_equal "Updated name", data["name"]
    end

    test "destroy" do
      assert_difference "Skill.count", -1 do
        delete "/skills/#{Skill.first.id}.json"
        assert_response 200
      end
    end
  end
end
