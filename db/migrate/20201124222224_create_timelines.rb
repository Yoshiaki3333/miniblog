class CreateTimelines < ActiveRecord::Migration[5.2]
  def change
    create_table :timelines do |t|
      t.integer :content_id
      t.integer :content_type
      t.timestamps
    end
  end
end
