class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :task_id
      t.integer :assigned_to_id
      t.string :status

      t.timestamps null: false
    end
  end
end
