class AddLessActiveMemberIndexToSurnameGivenName < ActiveRecord::Migration
  def change
    add_index(:less_active_members, [:surname, :given_name])
  end
end
