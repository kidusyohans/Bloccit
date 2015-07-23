class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
   before_action :configure_permitted_parameters, if: :devise_controller?
   
   protected
   
   def configure_permitted_parameters
     devise_parameter_sanitizer.for(:sign_up) << :name
   end
end

  before_action :flash_attack
    
    private
    
    def flash_attack
      unless flash_attack?
      flash[:error] = "You must be logged in to access this section"
      redirect_to new_login_url # halts request cycle
      end
    end
      

