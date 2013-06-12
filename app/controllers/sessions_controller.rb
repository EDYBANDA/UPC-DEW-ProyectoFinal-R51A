class SessionsController < ApplicationController
  
  skip_before_filter :fill_form, :only => [:create, :logInHandler, :destroy]
  def new

  end

  def create
  	# Facebook?  	
  	# abort(YAML::dump(env["omniauth.auth"]))
  	if env["omniauth.auth"]
  		user = User.from_omniauth(env["omniauth.auth"])  		
  		logInHandler(user, user.uid)
  	else
  		user = User.authenticate(params[:email], params[:password])
  		logInHandler(user)
  	end
  end

  def logInHandler(user, facebook = true)  	
  	if user && facebook
  		session[:user_id] = user.id
    	redirect_to root_url
    else
    	flash.now.alert = "Invalid email or password"  
      	render "new"
  	end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end