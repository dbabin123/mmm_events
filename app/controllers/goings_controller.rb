class GoingsController < ApplicationController
  before_action :set_going, only: [:show, :edit, :update, :destroy]

  # GET /goings
  def index
    @goings = Going.all
  end

  # GET /goings/1
  def show
  end

  # GET /goings/new
  def new
    @going = Going.new
  end

  # GET /goings/1/edit
  def edit
  end

  # POST /goings
  def create
    @going = Going.new(going_params)

    if @going.save
      redirect_to @going, notice: 'Going was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /goings/1
  def update
    if @going.update(going_params)
      redirect_to @going, notice: 'Going was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /goings/1
  def destroy
    @going.destroy
    message = "Going was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to goings_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_going
      @going = Going.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def going_params
      params.require(:going).permit(:profile_id, :event_id)
    end
end
