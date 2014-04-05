def current_user
  p session
  if session[:name]
      @current_user ||= User.where(name: session[:name]).first
      p @current_user
  end
end

# def logged_in?
# current_user?
# end