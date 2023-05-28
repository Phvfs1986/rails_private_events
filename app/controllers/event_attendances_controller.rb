# frozen_string_literal: true

class EventAttendancesController < ApplicationController
  def new
    @event = Event.find(params[:event])
    @event.attendees = current_user
  end
end
