class CreatePostingVotes < ActiveRecord::Migration
  def change
    create_table :posting_votes do |t|
      t.integer :value, null: false
      t.integer :posting_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
