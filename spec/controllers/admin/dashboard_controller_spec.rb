require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Admin::DashboardController do
  include Devise::TestHelpers
  
  describe "with admin login" do
    before(:each) do
      sign_out :user
      sign_in Factory(:admin_user)
    end

    it "should load the dashboard" do
      get :show
      response.should be_success
    end
  end
  
  describe "without admin login" do
    before(:each) do
      sign_out :user
      Factory(:admin_user)
      sign_in Factory(:valid_user)
    end

    it "should not load the dashboard" do
      get :show
      response.should redirect_to(account_url)
    end
    
  end
  
  describe "without a login" do
    
    it "should not load the dashboard" do
      get :show
      response.should redirect_to(new_user_session_url(:unauthenticated => true))
    end
    
  end

end
