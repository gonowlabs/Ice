require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe UserSessionsController do
  context "respondendo para DELETE destroy" do 
    before :each do
      controller.stub!(:require_user).and_return(nil)
      @user_session = mock(UserSession, :destroy => nil)
      controller.stub(:current_user_session).and_return(@user_session)
      controller.stub(:render)
      controller.stub(:redirect_back_or_default)
      @msg = "rqwfwefwegfw"
      I18n.stub(:t).with(:logout_successful).and_return(@msg)
    end
  
    it "deve destruir a sessão atual" do
      @user_session.should_receive(:destroy)
      delete :destroy
    end
    
    it "deve enviar o usuário para a última pagina se existir ou a raiz" do
      controller.should_receive(:redirect_back_or_default).with(root_path)
      delete :destroy
    end
    
    it "deve avisar que o usuario foi corretamente delogado" do
      delete :destroy
      flash[:notice].should eql(@msg)
    end
  end
end