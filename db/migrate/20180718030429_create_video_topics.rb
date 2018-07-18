class CreateVideoTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :video_topics do |t|
      t.integer :video_id
      t.integer :topic_id

      t.timestamps
    end
  end
end
