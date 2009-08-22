class Entry < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  validates_presence_of :user, :project, :date
end
