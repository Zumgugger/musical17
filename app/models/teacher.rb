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
#  phone           :integer
#  phone_secret    :boolean
#  phone2          :string(255)
#  phone_secret2   :boolean
#  activity        :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class Teacher < ActiveRecord::Base
  
  
    has_secure_password
    
    belongs_to :function
    
    
    validates_presence_of :first_name
    
    EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9._%+-]+\.[a-z]{2,4}\Z/i
    validates :email, :presence => true,
                    :length => {:maximum => 100},
                    :format => {:with => EMAIL_REGEX},
                    :confirmation => true
end
