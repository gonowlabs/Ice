require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/contracts/edit.html.erb" do
  include ContractsHelper
  
  before(:each) do
    assigns[:contract] = @contract = stub_model(Contract,
      :new_record? => false
    )
  end

  it "renders the edit contract form" do
    render
    
    response.should have_tag("form[action=#{contract_path(@contract)}][method=post]") do
    end
  end
end


