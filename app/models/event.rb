class Event < ApplicationRecord
    has_many :event_attendings, foreign_key: :attended_event_id
    has_many :attendees, through: :event_attendings, source: :event_attendee
    belongs_to :host, class_name: 'User', foreign_key: :host_id
end
