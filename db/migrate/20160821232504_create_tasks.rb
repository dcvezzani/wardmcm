class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.string :status
      t.integer :assigned_by_id

      t.timestamps null: false
    end
  end
end
