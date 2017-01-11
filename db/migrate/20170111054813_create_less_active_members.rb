class CreateLessActiveMembers < ActiveRecord::Migration
  def change
    create_table :less_active_members do |t|
      t.string :surname
      t.string :given_name
      t.text :current_address
      t.text :new_address
      t.string :new_phone
      t.text :reference

      t.timestamps null: false
    end
  end
end
