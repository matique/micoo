require "test_helper"

describe CookiesController do
  let(:sym) { :cookiesOK }
  let(:ok) { "x" }
  let(:accepted) { {sym => "x", :url => "A"} }
  let(:rejected) { {sym => "0", :url => "B"} }

  def test_cookies_accepted
    get :index, params: accepted
    assert_equal ok, cookies[sym]

    get :index, params: rejected
    refute cookies[sym]
  end

  def test_cookies_rejected
    get :index, params: rejected
    refute cookies[sym]

    get :index, params: accepted
    assert_equal ok, cookies[sym]
  end
end
