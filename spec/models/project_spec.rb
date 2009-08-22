require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Project do
  should_belong_to :contract
  should_have_and_belong_to_many :users
  should_validate_presence_of :name
end
