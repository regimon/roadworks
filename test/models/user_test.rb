require 'test_helper'

class UserTest < ActiveSupport::TestCase

def sign_in
  @request.env["devise.mapping"] = Devise.mappings[:admin]
end
	
  # test "the truth" do
  #   assert true
  # end
end
