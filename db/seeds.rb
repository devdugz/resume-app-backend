# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Creating test data..."

# Test user
test_user = User.find_or_create_by!(email: "test@example.com") do |user|
  user.first_name = "Test"
  user.last_name = "User"
  user.password = "password123"
  user.phone_number = "555-555-5555"
  user.short_bio = "Full-stack developer with passion for clean code"
  user.linkedin_url = "https://linkedin.com/in/testuser"
  user.twitter_handle = "@testuser"
  user.website_url = "https://testuser.dev"
  user.online_resume_url = "https://resume.testuser.dev"
  user.github_url = "https://github.com/testuser"
  user.photo = "https://via.placeholder.com/150"
end

# Test education entries
Education.find_or_create_by!(university_name: "Test University", degree: "BS Computer Science") do |edu|
  edu.start_date = "2018"
  edu.end_date = "2022"
  edu.details = "Major in Computer Science, Minor in Mathematics"
  edu.user_id = test_user.id
end

# Test experience entries
Experience.find_or_create_by!(company_name: "Test Corp", job_title: "Software Engineer") do |exp|
  exp.start_date = "2022"
  exp.end_date = "Present"
  exp.details = "Full-stack development using Ruby on Rails and React"
  exp.user_id = test_user.id
end

# Test projects
Project.find_or_create_by!(name: "Test Project") do |proj|
  proj.description = "A sample full-stack application"
  proj.url = "https://github.com/testuser/test-project"
  proj.screenshot = "https://via.placeholder.com/300"
  proj.user_id = test_user.id
end

# Test skills
["Ruby", "Rails", "React", "JavaScript", "PostgreSQL"].each do |skill_name|
  Skill.find_or_create_by!(skill_name: skill_name) do |skill|
    skill.user_id = test_user.id
  end
end

puts "Test data created successfully!"
