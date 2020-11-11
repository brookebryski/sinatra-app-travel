require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "my_session_secret"
    register Sinatra::Flash
  end

  get "/" do
    if logged_in?
      redirect "/users/#{current_user.id}"
    else
      erb :welcome
    end
  end

  helpers do
    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

   
    def logged_in?
      !!current_user
    end

    def redirect_if_not_logged_in
      if !logged_in?
        flash[:errors] = "Please log in to view this page."
        redirect '/login'
      end
    end

    def authorized_to_edit?(post)
      post.user == current_user
    end

    def find_post
      @post = Post.find(params[:id])
    end
    
  end

end

