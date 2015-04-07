class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def full_name
  	[self.first_name, self.last_name].join(' ')
  end

  def school_admin?
  	return self.type == "SchoolAdmin"
  end

  def donor?
  	return self.type == "Donor"
  end

  def dor?
  	return self.type == "Dor"
  end

  def household?
  	return self.type == "Household"
  end
  
end
