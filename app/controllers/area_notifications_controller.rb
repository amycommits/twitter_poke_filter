class AreaNotificationsController < ApplicationController
  before_action :set_area_notification, only: [:show, :edit, :update, :destroy]

  # GET /area_notifications
  # GET /area_notifications.json
  def index
    @area_notifications = AreaNotification.all
  end

  # GET /area_notifications/1
  # GET /area_notifications/1.json
  def show
  end

  # GET /area_notifications/new
  def new
    @area_notification = AreaNotification.new
  end

  # GET /area_notifications/1/edit
  def edit
  end

  # POST /area_notifications
  # POST /area_notifications.json
  def create
    @area_notification = AreaNotification.new(area_notification_params)

    respond_to do |format|
      if @area_notification.save
        format.html { redirect_to @area_notification, notice: 'Area notification was successfully created.' }
        format.json { render :show, status: :created, location: @area_notification }
      else
        format.html { render :new }
        format.json { render json: @area_notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /area_notifications/1
  # PATCH/PUT /area_notifications/1.json
  def update
    respond_to do |format|
      if @area_notification.update(area_notification_params)
        format.html { redirect_to @area_notification, notice: 'Area notification was successfully updated.' }
        format.json { render :show, status: :ok, location: @area_notification }
      else
        format.html { render :edit }
        format.json { render json: @area_notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /area_notifications/1
  # DELETE /area_notifications/1.json
  def destroy
    @area_notification.destroy
    respond_to do |format|
      format.html { redirect_to area_notifications_url, notice: 'Area notification was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_area_notification
      @area_notification = AreaNotification.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def area_notification_params
      params.require(:area_notification).permit(:name, :latitude, :longitude, :lower_left_latitude, :lower_left_longitude, :upper_right_latitude, :upper_right_longitude)
    end
end
