class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.string :user_id
      t.string :youtube_vid
      t.integer :views, default: 0
      t.string :desc

      t.timestamps
    end
  end
end
