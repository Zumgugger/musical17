class AddLeaderToFunction < ActiveRecord::Migration
  def change
    add_column :functions, :leader?, :boolean, :default => true
  end
end
