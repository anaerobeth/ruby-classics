class CreateBookshelves < ActiveRecord::Migration
  def change
    create_table :bookshelves do |t|
      t.integer :user_profile_id
      t.integer :posting_id
      t.string :status

      t.timestamps
    end
  end
end
