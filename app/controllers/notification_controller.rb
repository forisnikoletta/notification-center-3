class NotificationController < ApplicationController
	def home
		@notifications = Notification.all
		
		render json: @notifications

	end
end