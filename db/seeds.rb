# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Creating test users and their data..."

user_data = [
  {
    first_name: "John",
    last_name: "Doe",
    email: "john@example.com",
    password: "password123",
    phone_number: "555-111-1111",
    short_bio: "Senior Ruby Developer with 5 years experience",
    linkedin_url: "linkedin.com/in/johndoe",
    twitter_handle: "@johndoe",
    website_url: "johndoe.dev",
    online_resume_url: "resume.johndoe.dev",
    github_url: "github.com/johndoe",
    photo: "https://via.placeholder.com/150",
  },
  {
    first_name: "Jane",
    last_name: "Smith",
    email: "jane@example.com",
    password: "password123",
    phone_number: "555-222-2222",
    short_bio: "Frontend Developer specialized in React",
    linkedin_url: "linkedin.com/in/janesmith",
    twitter_handle: "@janesmith",
    website_url: "janesmith.dev",
    online_resume_url: "resume.janesmith.dev",
    github_url: "github.com/janesmith",
    photo: "https://via.placeholder.com/150",
  },
  {
    first_name: "Mike",
    last_name: "Johnson",
    email: "mike@example.com",
    password: "password123",
    phone_number: "555-333-3333",
    short_bio: "Full Stack Developer with AWS expertise",
    linkedin_url: "linkedin.com/in/mikej",
    twitter_handle: "@mikej",
    website_url: "mikej.dev",
    online_resume_url: "resume.mikej.dev",
    github_url: "github.com/mikej",
    photo: "https://via.placeholder.com/150",
  },
  {
    first_name: "Sarah",
    last_name: "Wilson",
    email: "sarah@example.com",
    password: "password123",
    phone_number: "555-444-4444",
    short_bio: "Backend Developer focusing on API design",
    linkedin_url: "linkedin.com/in/sarahw",
    twitter_handle: "@sarahw",
    website_url: "sarahw.dev",
    online_resume_url: "resume.sarahw.dev",
    github_url: "github.com/sarahw",
    photo: "https://via.placeholder.com/150",
  },
  {
    first_name: "Alex",
    last_name: "Brown",
    email: "alex@example.com",
    password: "password123",
    phone_number: "555-555-5555",
    short_bio: "DevOps Engineer with CI/CD expertise",
    linkedin_url: "linkedin.com/in/alexb",
    twitter_handle: "@alexb",
    website_url: "alexb.dev",
    online_resume_url: "resume.alexb.dev",
    github_url: "github.com/alexb",
    photo: "https://via.placeholder.com/150",
  },
]

created_users = user_data.map do |user_info|
  User.find_or_create_by!(email: user_info[:email]) do |user|
    user.update!(user_info)
  end
end

created_users.each do |user|
  case user.first_name
  when "John"
    Education.find_or_create_by!(university_name: "MIT", user_id: user.id) do |edu|
      edu.start_date = "2015"
      edu.end_date = "2019"
      edu.degree = "BS Computer Science"
      edu.details = "Focus on Artificial Intelligence and Machine Learning"
    end

    Experience.find_or_create_by!(company_name: "Google", user_id: user.id) do |exp|
      exp.start_date = "2019"
      exp.end_date = "Present"
      exp.job_title = "Senior Software Engineer"
      exp.details = "Leading backend development team for Google Cloud"
    end

    Project.find_or_create_by!(name: "AI Chat Assistant", user_id: user.id) do |proj|
      proj.description = "Built an AI-powered chat assistant using Python and TensorFlow"
      proj.url = "github.com/johndoe/ai-chat"
      proj.screenshot = "https://via.placeholder.com/300"
    end

    ["Python", "TensorFlow", "Ruby", "Go", "Kubernetes"].each do |skill|
      Skill.find_or_create_by!(skill_name: skill, user_id: user.id)
    end
  when "Jane"
    Education.find_or_create_by!(university_name: "Stanford", user_id: user.id) do |edu|
      edu.start_date = "2016"
      edu.end_date = "2020"
      edu.degree = "BS Web Development"
      edu.details = "Specialized in Frontend Architecture"
    end

    Experience.find_or_create_by!(company_name: "Meta", user_id: user.id) do |exp|
      exp.start_date = "2020"
      exp.end_date = "Present"
      exp.job_title = "Frontend Engineer"
      exp.details = "Working on React core team"
    end

    Project.find_or_create_by!(name: "React Component Library", user_id: user.id) do |proj|
      proj.description = "Open-source React component library with 1M+ downloads"
      proj.url = "github.com/janesmith/react-components"
      proj.screenshot = "https://via.placeholder.com/300"
    end

    ["React", "TypeScript", "CSS", "GraphQL", "Jest"].each do |skill|
      Skill.find_or_create_by!(skill_name: skill, user_id: user.id)
    end
  when "Mike"
    Education.find_or_create_by!(university_name: "UC Berkeley", user_id: user.id) do |edu|
      edu.start_date = "2017"
      edu.end_date = "2021"
      edu.degree = "BS Cloud Computing"
      edu.details = "AWS Certified Solutions Architect"
    end

    Experience.find_or_create_by!(company_name: "Amazon", user_id: user.id) do |exp|
      exp.start_date = "2021"
      exp.end_date = "Present"
      exp.job_title = "Cloud Architect"
      exp.details = "Designing scalable AWS infrastructure"
    end

    Project.find_or_create_by!(name: "Serverless Framework", user_id: user.id) do |proj|
      proj.description = "AWS Lambda-based serverless framework"
      proj.url = "github.com/mikej/serverless"
      proj.screenshot = "https://via.placeholder.com/300"
    end

    ["AWS", "Docker", "Node.js", "Terraform", "Python"].each do |skill|
      Skill.find_or_create_by!(skill_name: skill, user_id: user.id)
    end
  when "Sarah"
    Education.find_or_create_by!(university_name: "Georgia Tech", user_id: user.id) do |edu|
      edu.start_date = "2018"
      edu.end_date = "2022"
      edu.degree = "MS Software Engineering"
      edu.details = "Specialized in API Design and Microservices"
    end

    Experience.find_or_create_by!(company_name: "Microsoft", user_id: user.id) do |exp|
      exp.start_date = "2022"
      exp.end_date = "Present"
      exp.job_title = "Backend Engineer"
      exp.details = "Building Azure API Management services"
    end

    Project.find_or_create_by!(name: "API Gateway", user_id: user.id) do |proj|
      proj.description = "Open-source API Gateway with rate limiting and auth"
      proj.url = "github.com/sarahw/api-gateway"
      proj.screenshot = "https://via.placeholder.com/300"
    end

    ["Java", "Spring Boot", "Kubernetes", "MongoDB", "Redis"].each do |skill|
      Skill.find_or_create_by!(skill_name: skill, user_id: user.id)
    end
  when "Alex"
    Education.find_or_create_by!(university_name: "CMU", user_id: user.id) do |edu|
      edu.start_date = "2019"
      edu.end_date = "2023"
      edu.degree = "BS DevOps Engineering"
      edu.details = "Focus on CI/CD and Infrastructure Automation"
    end

    Experience.find_or_create_by!(company_name: "Netflix", user_id: user.id) do |exp|
      exp.start_date = "2023"
      exp.end_date = "Present"
      exp.job_title = "DevOps Engineer"
      exp.details = "Managing global CI/CD pipelines"
    end

    Project.find_or_create_by!(name: "Infrastructure as Code", user_id: user.id) do |proj|
      proj.description = "Terraform modules for multi-cloud deployment"
      proj.url = "github.com/alexb/terraform-modules"
      proj.screenshot = "https://via.placeholder.com/300"
    end

    ["Terraform", "Jenkins", "Ansible", "Docker", "Linux"].each do |skill|
      Skill.find_or_create_by!(skill_name: skill, user_id: user.id)
    end
  end
end

puts "Seeding completed! Created #{User.count} users with their unique associated records."
