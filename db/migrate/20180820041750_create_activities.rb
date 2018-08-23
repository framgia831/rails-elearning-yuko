class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.integer :action_id, polymorphic: true
      t.integer :user_id, foreign_key: true
      t.string :action_type
      t.timestamps
    end
    add_index :activities, [:action_type, :action_id]
  end
end
