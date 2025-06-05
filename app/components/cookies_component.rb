# frozen_string_literal: true

require "view_component"

class CookiesComponent < ViewComponent::Base
  def initialize(text: nil, url: nil, customize_url: nil)
    unless text
      text = []
      text << <<~EOS
        You may delete and block all cookies from this site,
        but parts of the site will not work.
      EOS
      text << <<~EOS
        Click "Accept" if you consent usage of cookies,
        otherwise click "Reject".
      EOS
    end

    @text = text
    @url = url || "/"
    @customize_url = customize_url
  end

  slim_template <<~HEREDOC
    css:
      div#cookies {
        background: #000000;
        font-color: #ffffff;
        color: white;
        font-size: 1.2rem;
        left: 0px;
        opacity: 40%;
        position: fixed;
        right: 0;
        top: 0;
        z-index:1000;
      }
      div#cookies p {
        margin: 10px;
      }
      div#cookies .buttons {
        margin: 10px;
        text-align: center;
      }
      div#cookies .buttons a {
        font-size: 1.2rem;
        text-decoration: none;
      }

    #cookies
      - accept_text = t("micoo.button.accept", default: "Accept")
      - reject_text = t("micoo.button.reject", default: "Reject")
      - customize_text = t("micoo.button.customize", default: "Customize")
      - [@text].flatten.each do |line|
        p = line.html_safe
      .buttons
        button
          a href=helpers.cookies_accept_path(url: @url) = accept_text
        button
          a href=helpers.cookies_reject_path(url: @url) = reject_text
        - unless @customize_url.nil?
          button
            a href=@customize_url = customize_text
  HEREDOC
end
