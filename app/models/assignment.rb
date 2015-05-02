# == Schema Information
#
# Table name: assignments
#
#  id             :integer          not null, primary key
#  department_id  :integer
#  text           :text
#  created_at     :datetime
#  updated_at     :datetime
#  name           :string(255)
#  competence?    :boolean          default(TRUE)
#  resposibility? :boolean          default(TRUE)
#  deadline       :datetime
#

class Assignment < ActiveRecord::Base
  
  belongs_to :department
  
  def customdate
    deadline.day.to_s + '.' + deadline.month.to_s + '.' + (deadline.year-2000).to_s
  end
  
  def self.import(file)
    CSV.foreach(file.path, headers: :true) do |row|
      Assignment.create! row.to_hash
      end #do
  end #def
  
end #class
