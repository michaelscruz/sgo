# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime
#  updated_at             :datetime
#  first_name             :string(255)
#  last_name              :string(255)
#  address                :text
#  phone                  :string(255)
#  relation               :string(255)
#  type                   :string(255)
#  school_id              :integer
#  terms_of_use           :boolean
#  donor_type             :string(255)
#  middle_initial         :string(255)
#  ssn                    :string(255)
#  apt                    :string(255)
#  city                   :string(255)
#  zip                    :string(255)
#  state                  :string(255)
#  one_time               :boolean
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable#, :validatable

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates_inclusion_of :terms_of_use, in: [true], message: "must be accepted to sign up", unless: :one_time_donor?
  validates_presence_of   :email, if: :email_required?
  validates_uniqueness_of :email, allow_blank: true, if: :email_changed?
  validates_format_of     :email, with: EMAIL_REGEX, allow_blank: true, if: :email_changed?

  validates_presence_of     :password, if: :password_required?
  validates_confirmation_of :password, if: :password_required?
  validates_length_of       :password, within: 8..20, allow_blank: true

  def full_name
  	[self.first_name, self.last_name].join(' ')
  end

  def school_admin?
  	return self.type == "SchoolAdminUser"
  end

  def donor?
  	return self.type == "DonorUser"
  end

  def dor?
  	return self.type == "DorUser"
  end

  def household?
  	return self.type == "HouseholdUser"
  end


private

  def password_required?
    !one_time_donor?
  end

  def email_required?
    password_required?
  end

  def one_time_donor?
    return self.one_time
  end
  
end
