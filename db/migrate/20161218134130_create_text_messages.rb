class CreateTextMessages < ActiveRecord::Migration
  def change
    create_table :text_messages do |t|
      t.string :subject
      t.string :body
      t.datetime :send_at

      t.timestamps null: false
    end
  end
end
