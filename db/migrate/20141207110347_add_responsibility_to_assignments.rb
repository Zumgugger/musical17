class AddResponsibilityToAssignments < ActiveRecord::Migration
  def change
    remove_column :assignments, :resposibility?
    add_column :assignments, :responsibility?, :boolean, :default => true
  end
end
