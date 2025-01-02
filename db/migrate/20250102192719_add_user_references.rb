class AddUserReferences < ActiveRecord::Migration[7.2]
  def change
    add_reference :experiences, :user, foreign_key: true
    add_reference :educations, :user, foreign_key: true
    add_reference :skills, :user, foreign_key: true
    add_reference :projects, :user, foreign_key: true
  end
end
