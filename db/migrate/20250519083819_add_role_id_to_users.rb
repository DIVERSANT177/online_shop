class AddRoleIdToUsers < ActiveRecord::Migration[7.2]
  def change
    add_reference :users, :role, null: false, foreign_key: true
    change_column_default :users, :role_id, 1
  end
end
