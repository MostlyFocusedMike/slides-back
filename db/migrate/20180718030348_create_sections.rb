class CreateSections < ActiveRecord::Migration[5.2]
  def change
    create_table :sections do |t|
      t.integer :slide_id
      t.integer :kind
      t.integer :order 
      t.string :content
      t.string :desc, default: "Descriptive text here"
      t.boolean :show_desc, default: false 

      t.timestamps
    end
  end
end
