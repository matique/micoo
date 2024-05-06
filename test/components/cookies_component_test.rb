require "test_helper"

class CookiesComponentTest < ViewComponent::TestCase
  def test_defaults
    render_inline(CookiesComponent.new)
    # puts page.native.to_html

    assert_selector "div#cookies"
  end

  def test_text
    text = "Hello."
    render_inline(CookiesComponent.new(text:))

    assert_text text
  end
end
