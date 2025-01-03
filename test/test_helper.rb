ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
require "test_helper"

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
  end
end

class ActionDispatch::IntegrationTest
  def setup
    @user = User.create!(
      first_name: "Test",
      last_name: "User",
      email: "test@example.com",
      password: "password",
    )
    post "/sessions", params: { email: "test@example.com", password: "password" }
  end
end
