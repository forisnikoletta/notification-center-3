class NotificationController < ApplicationController
	before_action :set_notification, only: [:show, :update, :destroy]
	before_action :ensure_client_user!

	include CurrentUserConcern

    def index
    	if @current_user
			@notifications = Notification.where(user_id: @current_user.id)
			puts @current_user.id
			render json: @notifications
		else 
			render json: {
				status: 404
			}
		end
        # @notifications = Notification.where(user_id: @current_user.id)
        # if(params[:tag])
        #   @notifications = @notifications.tagged_with(params[:tag])
        # end
        # render json: @notifications
    end

  # GET /notifications/1
  def show
  	# if the current user will access the show method for a prticular notification, 
  	# we will set it as seen (with the actual date)
    if @notification.user_id == @current_user.id.to_s
      @notification.update_attributes(:seen => Time.now)
    end
    render json: @notification
  end

  def ensure_client_user!
    unless User.find(session[:user_id]).roles == "client"
      render json: {
        status: 403
      }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notification
      @notification = Notification.find(params[:id])
    end
end