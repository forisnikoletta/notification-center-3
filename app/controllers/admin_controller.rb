class AdminController < ApplicationController
	before_action :set_notification, only: [:show, :update, :destroy]
  before_action :ensure_admin_user!

	include CurrentUserConcern

    def index
    @notifications = Notification.all

    render json: @notifications
  end

	  # POST /notifications
  def create
    @notification = Notification.new(notification_params)

    if @notification.save
      render json: @notification, status: :created, location: @notification
    else
      render json: @notification.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /notifications/1
  def update
    if @notification.update(notification_params)
      render json: @notification
    else
      render json: @notification.errors, status: :unprocessable_entity
    end
  end

  # DELETE /notifications/1
  def destroy
    @notification.destroy
  end

  def ensure_admin_user!
    unless User.find(session[:user_id]).roles == "admin"
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

    # Only allow a trusted parameter "white list" through.
    def notification_params
      params.require(:notification).permit(:title, :body, :users_id)
    end
end