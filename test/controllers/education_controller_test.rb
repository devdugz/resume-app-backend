require "test_helper"

class EducationsController < ApplicationController
  before_action :authenticate_user

  def create
    @education = Education.new(education_params)
    @education.user_id = current_user.id

    if @education.save
      render :show, status: :created
    else
      render json: { errors: @education.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def education_params
    params.require(:education).permit(:start_date, :end_date, :degree, :university_name, :details)
  end

  test "show" do
    get "/education/#{Education.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["start_date", "end_date", "details"], data.keys
  end

  test "update" do
    education = Education.first
    patch "/educations/#{education.id}.json", params: { name: "Updated name" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated name", data["name"]
  end

  test "destroy" do
    assert_difference "Education.count", -1 do
      delete "/educations/#{Education.first.id}.json"
      assert_response 200
    end
  end
end
