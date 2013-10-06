class AddUserIdToPostings < ActiveRecord::Migration
  def change
    add_column :postings, :user_id, :integer, null: false
  end
end
