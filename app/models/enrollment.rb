class Enrollment < ApplicationRecord
  belongs_to :event
  belongs_to :user

  validates :user, :event, presence: true

  validates_uniqueness_of :user_id, scope: :event_id
  validates_uniqueness_of :event_id, scope: :user_id
  validate :cant_subscribe_to_own_event

  def to_s
    "#{user} #{event}"
  end

  scope :upcoming, -> { joins(:event).merge(Event.upcoming) }
  scope :past, -> { joins(:event).merge(Event.past) }

  def get_users_invited_to_event(id)
    Invitation.where(event_id: id)
  end

  def get_events_attended_by_user(id)
    Invitation.where(user_id: id)
  end

  protected

  def cant_subscribe_to_own_event
    return unless new_record? && user_id.present? && event.present? && (user_id == event.host_id)

    errors.add(:base, 'You can not subscribe to your own event')
  end
end
