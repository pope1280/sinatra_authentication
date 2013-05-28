get '/' do
  # render home page
  @users = User.all
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  # render sign-in page 
  erb :sign_in
end

post '/sessions' do
  @user = User.authenticate(params[:email], params[:password])
  if @user 
    session[:id] = @user.id
    redirect '/'
  else 
    erb :sign_in
  end
end

delete '/sessions/:id' do
  # sign-out -- invoked via AJAX
  session.clear
  redirect '/'
end

#----------- USERS -----------

get '/users/new' do
  # render sign-up page
  erb :sign_up
end

post '/users' do
  @user = User.create(params[:user])
  if @user.valid?
    session[:id] = @user.id
    redirect '/'
  else
    erb :sign_up
  # sign-up a new user
  end
end
