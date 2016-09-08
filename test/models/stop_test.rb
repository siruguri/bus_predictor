require 'test_helper'

class StopTest < ActiveSupport::TestCase
  test 'it works' do
    r = Stop.new name: '53888', authority: 'AC Transit'
    r.save
  end
end
