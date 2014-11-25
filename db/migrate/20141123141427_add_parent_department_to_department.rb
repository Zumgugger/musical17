class AddParentDepartmentToDepartment < ActiveRecord::Migration
  def change
    add_reference :departments, :parent_department, index: true
  end
end
