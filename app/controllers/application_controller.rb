class ApplicationController < ActionController::Base

	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name,:last_name,:family_name_kana,:last_name_kana,:postcode,:street_adress,:phone_nember,:email])
	end

  private
	def after_sign_in_path(resource)
		case resource
		when Admin
			admin_top_path
		else
			root_path
		end
	end
end
