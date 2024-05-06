class ApplicationController < ActionController::Base
  before_action :always
  # protect_from_forgery with: :exception

  def always
    unless cookies[:cookiesOK] == "x"
      render CookiesComponent.new(url: root_path)
    end
  end
end
