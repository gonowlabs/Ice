class Project < ActiveRecord::Base
  belongs_to :contract
  has_and_belongs_to_many :users
  validates_presence_of :name
end
