class CreateUpvotes < ActiveRecord::Migration
  def change
    create_table :upvotes do |t|
      t.integer :post_id
      t.integer :user_id

      t.timestamps
    end

    add_index :upvotes, [:post_id, :user_id], unique: true
  end
end
