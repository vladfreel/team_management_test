class AddCreatorIdToRoles < ActiveRecord::Migration[7.1]
  def change
    add_reference :roles, :creator, foreign_key: {to_table: :users}
  end
end
