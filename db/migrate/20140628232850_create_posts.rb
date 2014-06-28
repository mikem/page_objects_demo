class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.integer :comment_count, default: 0, null: false

      t.timestamps
    end
  end
end
