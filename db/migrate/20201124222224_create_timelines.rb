class CreateTimelines < ActiveRecord::Migration[5.2]
  def change
    create_table :timelines do |t|
      t.integer :timelineable_id
      t.string  :timelineable_type
      t.timestamps
    end
  end
end
