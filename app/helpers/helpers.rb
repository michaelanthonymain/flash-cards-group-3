def current_user
  # p session
  if params[:name]
      @current_user ||= User.where(name: params[:name]).first
      # p @current_user
  end
end

# def logged_in?
# current_user?
# end