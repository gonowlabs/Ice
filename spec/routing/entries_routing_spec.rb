require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe EntriesController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "entries", :action => "index").should == "/entries"
    end
  
    it "maps #new" do
      route_for(:controller => "entries", :action => "new").should == "/entries/new"
    end
  
    it "maps #show" do
      route_for(:controller => "entries", :action => "show", :id => "1").should == "/entries/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "entries", :action => "edit", :id => "1").should == "/entries/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "entries", :action => "create").should == {:path => "/entries", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "entries", :action => "update", :id => "1").should == {:path =>"/entries/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "entries", :action => "destroy", :id => "1").should == {:path =>"/entries/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/entries").should == {:controller => "entries", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/entries/new").should == {:controller => "entries", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/entries").should == {:controller => "entries", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/entries/1").should == {:controller => "entries", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/entries/1/edit").should == {:controller => "entries", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/entries/1").should == {:controller => "entries", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/entries/1").should == {:controller => "entries", :action => "destroy", :id => "1"}
    end
  end
end
