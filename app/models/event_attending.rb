class EventAttending < ApplicationRecord
    validates :user_id, presence: true
    validates :event_id, presence: true

    belongs_to :event_attendee, class_name: 'User', foreign_key: :event_id
    belongs_to :attended_event, class_name:'Event', foreign_key: :user_id
end
