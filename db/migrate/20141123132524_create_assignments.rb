class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.references :department
      t.text :text

      t.timestamps
    end
    add_index :assignments, ["department_id"]
  end
end
