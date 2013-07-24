get '/' do
	# session.clear
  @users = User.all
  p @users
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  # render sign-in page 
  erb :sign_in
end

post '/sessions' do
	@user = login(params)
	if @user
  	session[:current_user] = @user
  	redirect '/'
  else
  	@error = "Incorrect username or password"
  	erb :sign_in
  end
end

delete '/sessions/:id' do
	session.clear
	redirect '/'
end

#----------- USERS -----------

get '/users/new' do
	erb :sign_up
end

post '/users' do
  @user = User.create(params)
  p User.all
  p "in user create"
  if !@user.errors.any? 
    p "creating session"
    p "successfully created user #{@user.name}"
    create_session(@user)
    p session
  else
  	p "Errors creating user: #{@user.errors.full_messages}"
  	@error = @user.errors.full_messages
  end
  redirect '/'
end