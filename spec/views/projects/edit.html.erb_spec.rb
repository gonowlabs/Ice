require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/projects/edit.html.erb" do
  include ProjectsHelper
  
  before(:each) do
    assigns[:project] = @project = stub_model(Project,
      :new_record? => false
    )
  end

  it "renders the edit project form" do
    render
    
    response.should have_tag("form[action=#{project_path(@project)}][method=post]") do
    end
  end
end


