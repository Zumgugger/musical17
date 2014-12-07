class AddCompetenceToAssignments < ActiveRecord::Migration
  def change
    add_column :assignments, :competence?, :boolean, :default => true
    add_column :assignments, :resposibility?, :boolean, :default => true
  end
end
