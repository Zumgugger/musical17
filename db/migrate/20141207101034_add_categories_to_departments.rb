class AddCategoriesToDepartments < ActiveRecord::Migration
  def change
    add_column :departments, :category, :string
  end
end
