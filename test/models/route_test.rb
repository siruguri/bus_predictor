require 'test_helper'

class RouteTest < ActiveSupport::TestCase
  test 'it works' do
    r = Route.new name: 'NL', authority: 'AC Transit'
    r.save
  end
end
