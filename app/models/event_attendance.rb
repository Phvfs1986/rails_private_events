# frozen_string_literal: true

class EventAttendance < ApplicationRecord
  belongs_to :user
  belongs_to :event
end
