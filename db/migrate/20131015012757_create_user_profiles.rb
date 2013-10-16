class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.integer :user_id
      t.text :about_me
      t.string :twitter
      t.string :github
      t.string :blog
      t.string :website

      t.timestamps
    end
  end
end
