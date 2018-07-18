class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.integer :video_id 
      t.integer :user_id 
      t.integer :timecode
      t.string :content
      t.timestamps
    end
  end
end
