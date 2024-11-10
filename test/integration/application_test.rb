require "test_helper"

describe ApplicationController do
  include Capybara::DSL

  def test_reject
    visit "/cookies/reject"
    assert page.has_content?("Accept")
    assert page.has_content?("Reject")
  end

  def test_click_reject
    visit "/cookies/reject"
    click_link("Reject")
    assert page.has_content?("Accept")
    assert page.has_content?("Reject")
  end

  def test_accept
    visit "/cookies/accept"
    refute page.has_content?("Accept")
    refute page.has_content?("Reject")
  end

  def test_click_accept
    visit "/cookies/reject"
    click_link("Accept")
    refute page.has_content?("Accept")
    refute page.has_content?("Reject")
  end

  def test_expires
    visit "/cookies/accept"
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
