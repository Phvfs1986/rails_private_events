# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  has_many :atendees, class_name: 'User', foreign_key: 'user_id'
end
