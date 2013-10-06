class CreatePostings < ActiveRecord::Migration
  def change
    create_table :postings do |t|
      t.string :title, null: false
      t.string :url, null: false
      t.string :category, null: false
      t.text :description, null: false

      t.timestamps
    end
  end
end
