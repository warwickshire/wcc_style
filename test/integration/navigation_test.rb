require 'test_helper'

class NavigationTest < ActionDispatch::IntegrationTest
#  fixtures :all

  def test_welcome
    get "/"
    assert_response :success
  end

  def test_about
    get "/wcc_style/pages/about"
    assert_response :success
  end

  def test_accessibility
    get "/wcc_style/pages/accessibility"
    assert_response :success
  end
end

