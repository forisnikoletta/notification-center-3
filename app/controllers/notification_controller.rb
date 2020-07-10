class NotificationController < ApplicationController
	def home
		render json: {status: "NotificationController - home"}
	end
end