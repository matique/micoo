require "test_helper"

describe ApplicationController do
  include Capybara::DSL

  def test_reject
    visit "/cookies/reject"
    # ic page.body
    assert_selector "div#cookies"
    assert page.has_content?("Accept")
  end

  def test_click_reject
    visit "/cookies/reject"
    click_link("Reject")
    assert_selector "div#cookies"
    assert page.has_content?("Accept")
  end

  def test_accept
    visit "/cookies/accept"
    assert_selector("div#cookies", count: 0)
    refute page.has_content?("Accept")
  end

  def test_click_accept
    visit "/cookies/reject"
    click_link("Accept")
    assert_selector("div#cookies", count: 0)
    refute page.has_content?("Accept")
  end

  def test_expires
    visit "/cookies/accept"
    assert page.has_content?("Root#home")

    travel(1.month - 10.seconds) do
      visit "/"
      assert_selector("div#cookies", count: 0)
      refute page.has_content?("Reject")
      assert page.has_content?("Root#home")
    end

    travel(1.month + 10.seconds) do
      visit "/"
      assert_selector "div#cookies"
      assert page.has_content?("Accept")
    end
  end
end
