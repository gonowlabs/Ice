require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ApplicationController do
  should_have_before_filter :require_user, :formats => [:html]
end