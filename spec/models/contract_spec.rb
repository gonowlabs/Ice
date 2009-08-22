require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Contract do
  should_have_many :projects
end
