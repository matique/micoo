class CookiesController < ActionController::Base
  def accept
    cookies[:cookiesOK] = {value: "x", expires: 1.month.from_now}
    redirect_to("/")
  end

  def reject
    cookies.delete(:cookiesOK)
    redirect_to("/")
  end
end
