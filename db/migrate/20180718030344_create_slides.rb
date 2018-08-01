class CreateSlides < ActiveRecord::Migration[5.2]
  def change
    create_table :slides do |t|
      t.integer :video_id
      t.integer :start, default: 0
      t.string :timecode, default: "0:00"
      t.string :title

      t.timestamps
    end
  end
end
