class CreateContactInfos < ActiveRecord::Migration
  def change
    create_table :contact_infos do |t|
      t.integer :user_id
      t.string :type
      t.string :name
      t.text :value

      t.timestamps null: false
    end
  end
end
