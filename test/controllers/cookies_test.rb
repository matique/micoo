require "test_helper"

describe CookiesController do
  let(:sym) { :cookiesOK }
  let(:ok) { "x" }

  def test_accept
    get :accept
    assert_equal ok, cookies[sym]
  end

  def test_reject
    get :reject
    refute cookies[sym]
  end

  def test_customize
    expected = "Define your own CookiesController#customize"
    error = assert_raise(RuntimeError) { get :customize }

    assert_equal expected, error.message
  end
end


# Test with redefined "customize" method.
# Outcommented as it interfered with previous test.
#
#class CookiesController < ActionController::Base
#  def customize
#    redirect_to("/")
#  end
#end
#
#describe CookiesController do
#  def test_customize
#    get :customize
#    assert true
#  end
#end
