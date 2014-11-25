class CreateFunctions < ActiveRecord::Migration
  def change
    create_table :functions do |t|
      t.references :teacher
      t.references :department
      t.string :name

      t.timestamps
    end
    
    add_index :functions, ["teacher_id", "department_id"]
  end
end
