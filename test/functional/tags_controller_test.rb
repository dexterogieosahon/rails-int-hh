require 'test_helper'

class TagsControllerTest < ActionController::TestCase
  
  context "showing a tag" do    
      
    setup do
      @tag = FactoryGirl.create(:tag)
      login_as(FactoryGirl.create(:user))
      get :show, id: @tag.id
    end
      
    should respond_with(:success)
    should assign_to(:tag).with { @tag }    
  
  end
  
  context "tagging a book" do
    
    setup do
      @book = FactoryGirl.create(:book)
      login_as(FactoryGirl.create(:user))
      
      post :create, book_id: @book.id, name: 'my_new_tag', format: :json
    end
    
    should respond_with(:success)
    should respond_with_content_type(:json)
    
    should "tag the book" do
      assert @book.tags.map { |tag| tag.name }.include?("my_new_tag")
    end
    
  end
  
end
