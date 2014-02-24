module SessionsHelper

  def current_user
    return nil if session[:token].nil?
    User.find_by(token: session[:token])
  end

  def logged_in?
    !!current_user
  end
end
