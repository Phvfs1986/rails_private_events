# frozen_string_literal: true

# The EventsController handles CRUD operations for events.
# It inherits from ApplicationController, which is the base controller class.
class EventsController < ApplicationController
  # GET /events
  # Retrieves all events from the database and assigns them to @events instance variable.
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  # GET /events/new
  # Initializes a new Event object and assigns it to @event instance variable.
  def new
    @event = Event.new
  end

  # POST /events
  # Creates a new event with the provided parameters.
  # If the event is successfully saved, it sets a flash notice and redirects to the root path.
  # Otherwise, it renders the new template with the status :unprocessable_entity.
  def create
    @event = Event.new(event_params)
    @event.creator = current_user

    if @event.save
      flash[:notice] = 'Event created!'
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def attend_event
    @event = Event.find(params[:id])
    redirect_to new_event_attendance_path(event: @event)
  end

  def destroy
    @event = Event.find(params[:id])

    if @event.destroy
      flash[:notice] = 'Event deleted!'
      redirect_to root_path
    else
      flash.now[:notice] = 'Something went wrong!'
      render :show
    end
  end

  private

  # Strong parameters method for event attributes.
  # It permits the required attributes for an event: description, date, time, and location.
  def event_params
    params.require(:event).permit(:name, :description, :date, :time, :location)
  end
end
