class User < ActiveRecord::Base
  ADMIN = 1
  MANAGER = 2
  
  has_and_belongs_to_many :projects
  acts_as_authentic
  
  def admin?
    role.eql? ADMIN
  end
  
  def manager?
    role.eql? MANAGER
  end
end