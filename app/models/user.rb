class User < ActiveRecord::Base
  has_and_belongs_to_many :teams

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me

  def email=(value)
    write_attribute(:email, value)
    self.password = value
    self.password_confirmation = value
  end
  

end
