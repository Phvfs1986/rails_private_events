# frozen_string_literal: true

class Event < ApplicationRecord
  validates_presence_of :name, :description, :date, :time, :location
  validates :name, uniqueness: true

  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  has_many :event_attendances, dependent: :destroy
  has_many :attendees, through: :event_attendances, source: :user, dependent: :destroy

  scope :past, -> { where('date <= ?', Time.now) }
  scope :upcoming, -> { where('date >= ?', Time.now) }

  def past?
    date <= Time.now
  end

  def upcoming?
    date >= Time.now
  end
end
