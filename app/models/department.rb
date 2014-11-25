# == Schema Information
#
# Table name: departments
#
#  id                   :integer          not null, primary key
#  name                 :string(255)
#  description          :text
#  created_at           :datetime
#  updated_at           :datetime
#  parent_department_id :integer
#

class Department < ActiveRecord::Base
  
  has_many :jobs
  belongs_to :parent_department, class_name: "Department"
  
  has_many :subdepartments, class_name: "Department",
                            foreign_key: "department_id"
  
  validates_presence_of :name
  
end