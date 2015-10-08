module SessionsHelper
 # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
    session[:user_email] = user.email
    session[:user_name] = user.name

  end
 
  # Returns the current logged-in user (if any).
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  # Logs out the current user.
  def log_out
    session.delete(:user_id)
    session.delete(:user_email)
    session.delete(:user_name)
    session.delete(:user_usertype)
    @current_user = nil
  end
end
