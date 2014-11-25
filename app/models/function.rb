# == Schema Information
#
# Table name: functions
#
#  id            :integer          not null, primary key
#  teacher_id    :integer
#  department_id :integer
#  name          :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class Function < ActiveRecord::Base
end
