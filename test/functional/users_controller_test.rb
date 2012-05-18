require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  
  context "sign up" do
  
    should "show the new user page" do
      get :new
      assert assigns(:user)
      assert assigns(:user).new_record?
    end
    
    should "create a user when given valid parameters" do
      assert_difference "User.count", +1 do
        assert_difference 'ActionMailer::Base.deliveries.size', +1 do
          post :create, user: {email: 'jane@company.com',
                               password: 'catsanddogs',
                               password_confirmation: 'catsanddogs'}
          welcome_email = ActionMailer::Base.deliveries.last
          assert_equal 'jane@company.com', welcome_email.to[0]
          assert_response :redirect
          assert_redirected_to root_path
          assert flash[:notice]
        end
      end
    end
    
    should "not create a user when given invalid parameters" do
      assert_difference "User.count", 0 do
        post :create, user: {password: 'catsanddogs',
                             password_confirmation: 'catsanddogs'}
        assert_response :success
        assert_template :new
        assert assigns(:user)
        assert !assigns(:user).valid?
      end
    end
    
  end
  
  context "respond to edit" do
    setup do
      @user = FactoryGirl.create(:user)
      login_as(@user)
      get :edit, id: @user.id
    end
    
    should respond_with(:success)
    
  end
  
  context "locale update" do
    setup do
      @user = FactoryGirl.create(:user)
      login_as(@user)
      @locale = "fi"
      put :update, id: @user.id, user: { locale: @locale }
    end
    
    should set_the_flash
    should respond_with(:redirect)
    
    should("redirect to home page after updated") { 
   	
   	 redirect_to(root_path) 
   	
   	}

    should "persist user locale preference" do
      assert_equal assigns(:user).locale, @locale
    end
    
  end
  
  
end
