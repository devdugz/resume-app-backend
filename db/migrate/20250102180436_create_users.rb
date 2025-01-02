class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :phone_number
      t.string :short_bio
      t.string :linkedin_url
      t.string :twitter_handle
      t.string :website_url
      t.string :online_resume_url
      t.string :github_url
      t.string :photo

      t.timestamps
    end
  end
end
