require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe EntriesHelper do
  include EntriesHelper
  
  it "should return local week days" do
    localized_week_days.should == ["Segunda", "Terça", "Quarta", "Quinta", "Sexta", "Sábado", "Domingo"]
  end
  
  it "should return local week dates" do
    localized_week_dates(Date.new 2009,12,12).should == ["07/12/2009", "08/12/2009", "09/12/2009", "10/12/2009", "11/12/2009", "12/12/2009", "13/12/2009"]
  end
  
end
