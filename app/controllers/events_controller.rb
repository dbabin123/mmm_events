class EventsController < ApplicationController
  before_action :current_profile_must_be_event_host,
                only: %i[edit update destroy]

  before_action :set_event, only: %i[show edit update destroy]

  def index
    @q = Event.ransack(params[:q])
    @events = @q.result(distinct: true).includes(:host,
                                                 :attendees).page(params[:page]).per(10)
  end

  def show
    @going = Going.new
  end

  def new
    @event = Event.new
  end

  def edit; end

  def create
    @event = Event.new(event_params)

    if @event.save
      message = "Event was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @event, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: "Event was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    message = "Event was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to events_url, notice: message
    end
  end

  private

  def current_profile_must_be_event_host
    set_event
    unless current_profile == @event.host
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:profile_id, :date_time, :location,
                                  :details, :comments)
  end
end
