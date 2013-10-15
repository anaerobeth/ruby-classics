class AddHometownToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :hometown, :string
  end
end
