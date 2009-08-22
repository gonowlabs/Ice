require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe EntriesHelper do
  include EntriesHelper
  
  it "should return local week days" do
    localized_week_days.should == ["Segunda", "Terça", "Quarta", "Quinta", "Sexta", "Sábado", "Domingo"]
  end  
end
