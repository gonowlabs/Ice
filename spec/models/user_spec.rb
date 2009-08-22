require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe User do
  should_have_and_belong_to_many :projects
  should_be_authentic
end