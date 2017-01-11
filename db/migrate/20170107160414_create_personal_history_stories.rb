class CreatePersonalHistoryStories < ActiveRecord::Migration
  def change
    create_table :personal_history_stories do |t|
      t.string :subject
      t.text :body
      t.datetime :took_place_at

      t.timestamps null: false
    end
  end
end
