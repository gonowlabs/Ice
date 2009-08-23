require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe EntriesHelper do
  include EntriesHelper

  it "should return local week days" do
    localized_week_days.should == ["Segunda", "Terça", "Quarta", "Quinta", "Sexta", "Sábado", "Domingo"]
  end

  context "formatting hours" do
    it "should return the hour without zeros if can be parsed to integer" do
      format_hour(9.0).should eql('9')
    end

    it "should delete zeros in the right" do
      format_hour(13.4500).should eql("13.45")
    end
  end
end
