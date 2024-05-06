class CookiesController < ActionController::Base
  def index
    sym = :cookiesOK
    if params[sym] == "x"
      cookies[sym] = {value: "x", expires: 1.month.from_now}
    else
      cookies.delete(sym)
    end

    redirect_to(params[:url] || "/")
  end
end
