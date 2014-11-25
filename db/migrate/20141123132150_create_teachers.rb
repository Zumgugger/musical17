class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :first_name
      t.string :last_name
      t.string :password_digest
      t.string :email
      t.boolean :email_secret
      t.integer :phone
      t.boolean :phone_secret
      t.string :phone2
      t.boolean :phone_secret2
      t.integer :activity

      t.timestamps
    end
    
    add_index :teachers, ["first_name"]
  end
end
