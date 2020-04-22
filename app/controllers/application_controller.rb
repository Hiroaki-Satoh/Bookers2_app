# dviseのコントローラーに修正が必要な場合はここに記述する。
class ApplicationController < ActionController::Base

  	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :authenticate_user!, { except: [:top, :about] }

	protect_from_forgery with: :exception

  	protected
		# サインイン後の遷移先の指定
  		def after_sign_in_path_for(resource)
    		user_path(current_user.id)
  		end

		# ログイン後の遷移先の指定
		def after_sign_up_path_for(resource)
      		user_path(current_user.id)
  		end

		# サインアウト後の遷移先の指定
  		def after_sign_out_path_for(resource)
  			root_path
  		end

		# sign upの際にnameのデータ操作を許可する。
  		def configure_permitted_parameters
    		devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  		end
	end