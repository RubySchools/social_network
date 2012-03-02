module UserSessionsHelper
	def authenticate
		deny_access unless signed_in?
	end
	def deny_access
		store_location
		redirect_to new_user_path, :notice => "Please sign in to access this page."
	end
end
