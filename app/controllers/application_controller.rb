class ApplicationController < ActionController::Base
   before_action :authenticate_user!, except: [:top,:about]
   before_action :configure_permitted_parameters, if: :devise_controller?
   add_flash_types :success, :info, :warning, :danger#フラッシュメッセージに記載

     def after_sign_in_path_for(resorce)
       flash[:notice] = "Signed in successfully."
     user_path(current_user.id)
     end

   def after_sign_up_path_for(resorce)
     flash[:notice] = "Welcome! You have signed up successfully."
     user_path(current_user.id)
   end

   def destroy_user_session_path_for(resorce)
    flash[:notice] ="Signed out successfully."
    
   end




    protected

    def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
    end

   #フラッシュメッセージ
    #add_flash_types :success, :info, :warning, :danger
end
