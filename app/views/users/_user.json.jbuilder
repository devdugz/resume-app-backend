json.extract! user, :id, :first_name, :last_name, :email, :phone_number, 
                    :short_bio, :linkedin_url, :twitter_handle, :website_url, 
                    :online_resume_url, :github_url, :photo, 
                    :created_at, :updated_at
json.url user_url(user, format: :json)

