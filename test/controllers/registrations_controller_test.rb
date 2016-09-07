require 'test_helper'

class RegistrationsControllerTest < ActionController::TestCase
  test 'list' do
    get :index
    assert_select 'li', count: Registration.count
  end
end
