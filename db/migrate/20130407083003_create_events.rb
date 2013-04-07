class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :type
      t.text :data
      t.datetime :github_created_at, :null => false
      t.references :actor

      t.timestamps
    end
    add_index :events, :actor_id
  end
end
