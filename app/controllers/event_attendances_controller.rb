# frozen_string_literal: true

class EventAttendancesController < ApplicationController
  def new
    @event = Event.find(params[:event])
    @user = current_user
    @event_attendance = EventAttendance.new(user: @user, event: @event)

    if @event_attendance.save
      flash[:notice] = 'Have fun!'
      redirect_to @event
    else
      flash.now[:notice] = 'Something went wrong!'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @event_attendance = EventAttendance.find(params[:id])

    if @event_attendance.destroy
      flash[:notice] = 'Attendee removed'
      redirect_to user_show_path(params[:user])
    else
      flash.now[:notice] = 'Cannot remove attendee'
      redirect_to root_path
    end
  end
end
