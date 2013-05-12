class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  # Devise Configuration
  # ========================================================================
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  # Relationships
  # ========================================================================
  has_one :teacher # a user may have an associated teacher account


  # Methods
  # ========================================================================
  def is_teacher?
  	# if there's not a teacher with this user id
  	if Teacher.for_user(self.id).first.nil?
  		return false
  	else
  		return true
  	end  
  end

  def teacher
    if self.is_teacher?
      return Teacher.for_user(self.id).first
    else
      return nil
    end
  end

  def is_admin?
    return !(self.is_teacher?)
  end
  
end
