# frozen_string_literal: true

class EventCreatorMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def event_created_email(event)
    @event = event
    @creator = @event.creator

    mail(to: @creator.email, subject: "#{@event.name} created successfully!")
  end
end
