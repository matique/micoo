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

  def test_text_with_anchors
    # text = "Hi <a href=/a/url> Customize </a>."
    text = "A<br>C"
    render_inline(CookiesComponent.new(text:))

    assert_match(/.*#{text}.*/, page.native.to_html)
  end

  def test_without_customize
    render_inline CookiesComponent.new

    refute_text "Customize"
  end

  def test_customize
    render_inline(CookiesComponent.new(customize_url: "/cookies/customize"))

    assert_text "Customize"
  end
end
