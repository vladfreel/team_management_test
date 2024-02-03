class ChangeRoleToString < ActiveRecord::Migration[7.1]
  def change
    change_column :roles, :name, :string, default: "user"
  end
end
