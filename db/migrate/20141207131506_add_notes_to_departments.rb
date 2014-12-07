class AddNotesToDepartments < ActiveRecord::Migration
  def change
    add_column :departments, :notes, :text
  end
end