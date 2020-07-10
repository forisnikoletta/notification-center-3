class SessionsController < ApplicationController
	# this is gonna be a POST request, so when the front-end app will hit this api, it's going to make a post resuest here to create
	
	include CurrentUserConcern

	def create
	 	#it will wrap up a user object
	 	user = User
	 			.find_by(email: params["user"]["email"])
	 			.try(:authenticate, params["user"]["password"])

	 	if user
	 		session[:user_id] = user.id
	 		render json: {
	 			status: :created,
	 			logged_in: true,
	 			user: user
	 		}
	 	else 
	 		render json: {
	 			status: 401
	 		}
	 	end
	end

	def logged_in
		if @current_user
			render json: {
				logged_in: true,
				user: @current_user
			}
		else 
			render json: {
				logged_in: false
			}
		end
	end

	def logout
		reset_session
		render json: {
			status: 200, 
			logged_out: true
		}
	end
end	 