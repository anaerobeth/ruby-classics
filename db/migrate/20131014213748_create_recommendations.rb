class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.integer :user_id, null: false
      t.integer :posting_id, null: false

      t.timestamps
    end
  end
end
