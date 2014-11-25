# == Schema Information
#
# Table name: assignments
#
#  id            :integer          not null, primary key
#  department_id :integer
#  text          :text
#  created_at    :datetime
#  updated_at    :datetime
#

require 'test_helper'

class AssignmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
