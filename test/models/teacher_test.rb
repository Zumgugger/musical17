# == Schema Information
#
# Table name: teachers
#
#  id              :integer          not null, primary key
#  first_name      :string(255)
#  last_name       :string(255)
#  password_digest :string(255)
#  email           :string(255)
#  email_secret    :boolean
#  phone           :string(255)
#  phone_secret    :boolean
#  phone2          :string(255)
#  phone_secret2   :boolean
#  activity        :integer
#  created_at      :datetime
#  updated_at      :datetime
#  token           :string(255)
#  description     :text
#

require 'test_helper'

class TeacherTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
