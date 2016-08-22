class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :notable_id
      t.string :notable_type
      t.integer :author_id
      t.string :title
      t.text :body

      t.timestamps null: false
    end
  end
end
