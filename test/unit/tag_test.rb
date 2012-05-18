require 'test_helper'

class TagTest < ActiveSupport::TestCase

  context 'tag instance' do
    
    subject { FactoryGirl.create(:tag) }
   
    should validate_presence_of   :name
    should validate_uniqueness_of :name
    
  end


end
