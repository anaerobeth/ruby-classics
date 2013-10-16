class AddAvailabilitiesToUserProfiles < ActiveRecord::Migration
  def change
    add_column :user_profiles, :for_hire, :boolean
    add_column :user_profiles, :for_pairing, :boolean
  end
end
