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
#  category             :string(255)
#

require 'test_helper'

class DepartmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
