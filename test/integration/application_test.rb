require "test_helper"

describe ApplicationController do
  include Capybara::DSL
  let(:sym) { :cookiesOK }

  def test_cookies_reset
    visit "/cookies"
    assert page.has_content?("Accept")
    assert page.has_content?("Reject")
  end

  def test_cookiesOK
    visit "/cookies?cookiesOK=x&url=/"
    assert page.has_content?("Root#home")
  end

  def test_click_accept
    visit "/cookies" # reset
    click_link("Accept")
    assert page.has_content?("Root#home")
  end

  def test_click_reject
    visit "/cookies" # reset
    click_link("Reject")
    assert page.has_content?("Accept")
    assert page.has_content?("Reject")
  end

  def test_expires
    visit "/cookies?cookiesOK=x&url=/"
    assert page.has_content?("Root#home")

    travel(1.month - 10.seconds) do
      visit "/"
      assert page.has_content?("Root#home")
    end

    travel(1.month + 10.seconds) do
      visit "/"
      assert page.has_content?("Accept")
      assert page.has_content?("Reject")
    end
  end
end
