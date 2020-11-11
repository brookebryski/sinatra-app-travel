class UsersController < ApplicationController

    #render form
    get '/login' do
      erb :login
    end
  
    #create a session
    post '/login' do
      #[x] recieve the input from login form
      #[x] find the user
      @user = User.find_by(email: params[:email])
      #authenticate the user
      if @user && @user.authenticate(params[:password])
        #[x] log them in - creating a session, adding a key/value pair to session hash
        session[:user_id] = @user.id
        # [] success message
        flash[:message] = "Welcome back #{@user.name}!"
        #[x] redirects to user profile
        redirect "users/#{@user.id}"
      else
        # [x] show an error
        flash[:errors] = "Wrong credentials!"
        #redirect to login form
        redirect '/login'
      end
    end
  
    #user SHOW route
    get '/users/:id' do
      #find the user
      @user = User.find_by(id: params[:id])
      erb :'/users/show'
    end
  
    #render sign up form
    get '/signup' do
      #render my sign form
      erb :signup
    end
  
    #create new user using sign up form
    post '/users' do
      @user = User.new(params)
      if @user.save
        #[x] log them in - creating a session, adding a key/value pair to session hash
        session[:user_id] = @user.id
        flash[:message] = "#{@user.name}, Welcome!"
        redirect "/users/#{@user.id}"
      else
        #not valid input
        flash[:errors] = "Account creation failure: #{@user.errors.full_messages.to_sentence}"
        redirect '/signup'
      end
    end
  
    #logs out user by clearing session hash
    get '/logout' do
      #binding.pry
      session.clear
      #binding.pry
      redirect '/'
    end
  
  
  
  end
  