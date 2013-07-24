helpers do

	# Returns current user from session
  def current_user
    session[:current_user]
  end

  # Validates user login
  def login(params)
    @user = User.find_by_email(params[:email])
    if @user && @user.password == params[:password]
    	p "Login successful for #{@user.name}"
      return @user
    else
    	p "Login unsuccessful"
      return false
    end
  end

  # Creates user or returns errors if ActiveRecord validaitons fail
  def create_user(params)
  	@user = User.create(params)
  end

  def create_session(user)
  	session[:current_user] = user
  end

end
