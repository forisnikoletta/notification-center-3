class AdminController < ApplicationController
	before_action :set_notification, only: [:show, :update, :destroy]
  #before_action :ensure_admin_user!

	include CurrentUserConcern

  # GET /admin
  def index
    if @current_user && is_admin?
      @notifications = Notification.all
      puts @current_user_role
      render json: @notifications
    else 
      render json: {
        status: 404
      }
    end
  end


  # GET /admin/1
  def show
    # if the current user will access the show method for a prticular notification, 
    # we will set it as seen (with the actual date)
    if @current_user && is_admin?
        render json: @notification
    else 
        render json: {
          status: 404
        }
    end
  end


	# POST /admin
  def create
    if @current_user && is_admin?
        @notification = Notification.new(notification_params)

        if @notification.save
          render json: @notification, status: :created, location: @notification
        else
          render json: @notification.errors, status: :unprocessable_entity
        end
    else 
        render json: {
          status: 403
        }
    end
  end

  # PATCH/PUT /admin/1
  def update
    if @current_user && is_admin?
        if @notification.update(notification_params)
          render json: @notification
        else
          render json: @notification.errors, status: :unprocessable_entity
        end
    else 
        render json: {
          status: 403
        }
    end

  end

  # DELETE /admin/1
  def destroy
    if @current_user && is_admin?
        @notification.destroy
    else
        render json: {
          status: 403
        }
    end
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