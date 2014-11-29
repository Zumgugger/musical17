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

class Teacher < ActiveRecord::Base
  
  
    #has_secure_password
    
    has_many :functions
    has_many :departments, through: :functions
    accepts_nested_attributes_for :functions
    
    def name
      self.first_name.to_s + ' ' + self.last_name.to_s
    end
    
    validates_presence_of :name
    validates_uniqueness_of :token
    
    #EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9._%+-]+\.[a-z]{2,4}\Z/i
    #validates :email, :presence => true,
    #                :length => {:maximum => 100},
    #                :format => {:with => EMAIL_REGEX},
    #                :confirmation => true
end
