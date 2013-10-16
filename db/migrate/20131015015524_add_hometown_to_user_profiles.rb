class AddHometownToUserProfiles < ActiveRecord::Migration
  def change
    add_column :user_profiles, :hometown, :string
  end
end
