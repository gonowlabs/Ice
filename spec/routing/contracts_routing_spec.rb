require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ContractsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "contracts", :action => "index").should == "/contracts"
    end
  
    it "maps #new" do
      route_for(:controller => "contracts", :action => "new").should == "/contracts/new"
    end
  
    it "maps #show" do
      route_for(:controller => "contracts", :action => "show", :id => "1").should == "/contracts/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "contracts", :action => "edit", :id => "1").should == "/contracts/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "contracts", :action => "create").should == {:path => "/contracts", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "contracts", :action => "update", :id => "1").should == {:path =>"/contracts/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "contracts", :action => "destroy", :id => "1").should == {:path =>"/contracts/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/contracts").should == {:controller => "contracts", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/contracts/new").should == {:controller => "contracts", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/contracts").should == {:controller => "contracts", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/contracts/1").should == {:controller => "contracts", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/contracts/1/edit").should == {:controller => "contracts", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/contracts/1").should == {:controller => "contracts", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/contracts/1").should == {:controller => "contracts", :action => "destroy", :id => "1"}
    end
  end
end
