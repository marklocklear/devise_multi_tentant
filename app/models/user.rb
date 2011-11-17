class User < ActiveRecord::Base
  belongs_to :organization
  accepts_nested_attributes_for :organization

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :organization_attributes, :role

  ROLES = %w[user admin]

#Calling this from the controller for multi-tenancy
  def self.get_users(current_org)
    current_org.users
  end

end
