module CurrentUserConcern
	extend ActiveSupport::Concern

	included do 
		before_action :set_current_user
		before_action :set_current_user_role
		before_action :is_admin?
	end

	def set_current_user
		if session[:user_id]
			@current_user = User.find(session[:user_id])
		end
	end

	def set_current_user_role
		if session[:user_roles]
			@current_user_role = session[:user_roles]
		end
	end

    # Check if the role of the current user is client
    def is_client?
      @current_user_role == "client"
    end

	# Check if the role of the current user is admin
    def is_admin?
      @current_user_role == "admin"
    end

end