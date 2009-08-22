class Comment < ActiveRecord::Base
  belongs_to :entry
  belongs_to :author, :class_name => 'User'
  validates_presence_of :entry, :author, :body
end
