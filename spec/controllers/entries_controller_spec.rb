require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe EntriesController do

  def mock_entry(stubs={})
    @mock_entry ||= mock_model(Entry, stubs)
  end
  
  describe "GET index" do
    it "assigns all entries as @entries" do
      Entry.stub!(:find).with(:all).and_return([mock_entry])
      get :index
      assigns[:entries].should == [mock_entry]
    end
  end

  describe "GET show" do
    it "assigns the requested entry as @entry" do
      Entry.stub!(:find).with("37").and_return(mock_entry)
      get :show, :id => "37"
      assigns[:entry].should equal(mock_entry)
    end
  end

  describe "GET new" do
    it "assigns a new entry as @entry" do
      Entry.stub!(:new).and_return(mock_entry)
      get :new
      assigns[:entry].should equal(mock_entry)
    end
  end

  describe "GET edit" do
    it "assigns the requested entry as @entry" do
      Entry.stub!(:find).with("37").and_return(mock_entry)
      get :edit, :id => "37"
      assigns[:entry].should equal(mock_entry)
    end
  end

  describe "POST create" do
    
    describe "with valid params" do
      it "assigns a newly created entry as @entry" do
        Entry.stub!(:new).with({'these' => 'params'}).and_return(mock_entry(:save => true))
        post :create, :entry => {:these => 'params'}
        assigns[:entry].should equal(mock_entry)
      end

      it "redirects to the created entry" do
        Entry.stub!(:new).and_return(mock_entry(:save => true))
        post :create, :entry => {}
        response.should redirect_to(entry_url(mock_entry))
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved entry as @entry" do
        Entry.stub!(:new).with({'these' => 'params'}).and_return(mock_entry(:save => false))
        post :create, :entry => {:these => 'params'}
        assigns[:entry].should equal(mock_entry)
      end

      it "re-renders the 'new' template" do
        Entry.stub!(:new).and_return(mock_entry(:save => false))
        post :create, :entry => {}
        response.should render_template('new')
      end
    end
    
  end

  describe "PUT update" do
    
    describe "with valid params" do
      it "updates the requested entry" do
        Entry.should_receive(:find).with("37").and_return(mock_entry)
        mock_entry.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :entry => {:these => 'params'}
      end

      it "assigns the requested entry as @entry" do
        Entry.stub!(:find).and_return(mock_entry(:update_attributes => true))
        put :update, :id => "1"
        assigns[:entry].should equal(mock_entry)
      end

      it "redirects to the entry" do
        Entry.stub!(:find).and_return(mock_entry(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(entry_url(mock_entry))
      end
    end
    
    describe "with invalid params" do
      it "updates the requested entry" do
        Entry.should_receive(:find).with("37").and_return(mock_entry)
        mock_entry.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :entry => {:these => 'params'}
      end

      it "assigns the entry as @entry" do
        Entry.stub!(:find).and_return(mock_entry(:update_attributes => false))
        put :update, :id => "1"
        assigns[:entry].should equal(mock_entry)
      end

      it "re-renders the 'edit' template" do
        Entry.stub!(:find).and_return(mock_entry(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end
    
  end

  describe "DELETE destroy" do
    it "destroys the requested entry" do
      Entry.should_receive(:find).with("37").and_return(mock_entry)
      mock_entry.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the entries list" do
      Entry.stub!(:find).and_return(mock_entry(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(entries_url)
    end
  end

end
