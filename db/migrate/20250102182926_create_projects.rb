class CreateProjects < ActiveRecord::Migration[7.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description
      t.string :url
      t.string :screenshot

      t.timestamps
    end
  end
end
