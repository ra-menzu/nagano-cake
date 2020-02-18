class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name,:last_name,:family_name_kana,:last_name_kana,:postcode,:street_adress,:phone_nember,:email])
	end

  private
	def after_sign_in_path_for(resource)
		case resource
		when Admin
			admin_top_path
		else
			root_path
		end
	end
	def after_sign_out_path_for(resource)
        admin_top_path
	end
end
