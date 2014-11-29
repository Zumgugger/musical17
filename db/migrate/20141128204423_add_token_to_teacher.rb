class AddTokenToTeacher < ActiveRecord::Migration
  def change
    add_column :teachers, :token, :string
    add_column :teachers, :description, :text
    reversible do |dir|
      change_table :teachers do |t|
        dir.up   { t.change :phone, :string }
        dir.up   { t.change :phone2, :string }
      end
    end
  end
end
