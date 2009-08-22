require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Report do
  it "should return the cost for a contract in a period" do
    cost = Report.cost_by_contract contract_id, :from => (Date.today - 10), :to => Date.today
    cost.should eql(result)
  end
end