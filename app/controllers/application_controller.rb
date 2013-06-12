class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :fill_form, :only => [:new, :edit, :update, :create, :save, :destroy]

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def fill_form
  	# abort(YAML::dump(current_user))
  	if current_user
  		if current_user.document_type ==  nil
  			redirect_to('/sign')
  		end  		 
  	end  	
  end
  helper_method :current_user
end
