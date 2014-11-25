class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
    
    add_index :departments, ["name"]
  end
end
