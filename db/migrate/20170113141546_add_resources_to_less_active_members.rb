class AddResourcesToLessActiveMembers < ActiveRecord::Migration
  def change
    add_column :less_active_members, :resources, :text
  end
end
