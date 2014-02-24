class CreateFriendCircles < ActiveRecord::Migration
  def change
    create_table :friend_circles do |t|
      t.string :name, null: false
      t.integer :user_id, null: false

      t.timestamps
    end

    create_table :circle_memberships do |t|
      t.integer :friend_circle_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end

    add_index :circle_memberships, :user_id
    add_index :circle_memberships, :friend_circle_id
    add_index :friend_circles, :user_id
  end
end
