require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe EntriesController do
  context "on update" do
    before :each do
      @id = '10'
    end
    
    context "when user is a manager" do
      before :each do
        login_manager
      end
      
      it "should update only the status" do
        Entry.should_receive(:update).with(@id, :status => Entry::APPROVED.to_s)
        put :update, :id => @id, :hours => 4, :status => Entry::APPROVED
      end
    end
    
    context "when user is a worker" do
      before :each do
        login
      end
      
      it "should update only the hours if the status is not approved" do
        hours = "12"
        Entry.should_receive(:update_all).with("hours = #{hours}", "(status is null or status <> #{Entry::APPROVED}) AND id = #{@id}")
        put :update, :id => @id, :hours => hours, :status => "3"
      end
    end
  end
end