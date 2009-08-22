require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Comment do
  should_belong_to :entry
  should_belong_to :author, :class_name => 'User'
  should_validate_presence_of :entry, :author, :body
end
