class EventAttendingsController < ApplicationController
  before_action :set_event_attending, only: %i[ show edit update destroy ]

  # GET /event_attendings or /event_attendings.json
  def index
    @event_attendings = EventAttending.all
  end

  # GET /event_attendings/1 or /event_attendings/1.json
  def show
  end

  # GET /event_attendings/new
  def new
    @event_attending = EventAttending.new
  end

  # GET /event_attendings/1/edit
  def edit
  end

  # POST /event_attendings or /event_attendings.json
  def create
    @event_attending = EventAttending.new(event_attending_params)

    respond_to do |format|
      if @event_attending.save
        format.html { redirect_to @event_attending, notice: "Event attending was successfully created." }
        format.json { render :show, status: :created, location: @event_attending }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event_attending.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_attendings/1 or /event_attendings/1.json
  def update
    respond_to do |format|
      if @event_attending.update(event_attending_params)
        format.html { redirect_to @event_attending, notice: "Event attending was successfully updated." }
        format.json { render :show, status: :ok, location: @event_attending }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event_attending.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_attendings/1 or /event_attendings/1.json
  def destroy
    @event_attending.destroy
    respond_to do |format|
      format.html { redirect_to event_attendings_url, notice: "Event attending was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_attending
      @event_attending = EventAttending.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_attending_params
      params.fetch(:event_attending, {})
    end
end
