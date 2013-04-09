class AddIndexToChecksum < ActiveRecord::Migration
  def change
    add_index :events, :checksum, :unique => true
  end
end
