class GoingsController < ApplicationController
  before_action :set_going, only: %i[show edit update destroy]

  def index
    @q = Going.ransack(params[:q])
    @goings = @q.result(distinct: true).includes(:attendee,
                                                 :event).page(params[:page]).per(10)
  end

  def show; end

  def new
    @going = Going.new
  end

  def edit; end

  def create
    @going = Going.new(going_params)

    if @going.save
      message = "Going was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @going, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @going.update(going_params)
      redirect_to @going, notice: "Going was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @going.destroy
    message = "Going was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to goings_url, notice: message
    end
  end

  private

  def set_going
    @going = Going.find(params[:id])
  end

  def going_params
    params.require(:going).permit(:profile_id, :event_id)
  end
end
