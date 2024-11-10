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
end
