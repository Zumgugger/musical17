class AddDeadlineToAssignments < ActiveRecord::Migration
  def change
    add_column :assignments, :deadline, :datetime, :default => nil
  end
end
