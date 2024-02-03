class CreateRoles < ActiveRecord::Migration[7.1]
  def change
    create_table :roles do |t|
      t.integer :name, null: false, default: 0
      t.text :description

      t.timestamps
    end
  end
end
