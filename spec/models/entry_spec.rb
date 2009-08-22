require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Entry do
  should_belong_to :user
  should_belong_to :project
  should_validate_presence_of :user, :project, :date
end
