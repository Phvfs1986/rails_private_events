# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :event_attendances
  has_many :attended_events, through: :event_attendances, source: :event
  has_many :created_events, class_name: 'Event', foreign_key: 'user_id'
end
