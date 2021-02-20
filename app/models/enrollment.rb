class Enrollment < ApplicationRecord
  belongs_to :event
  belongs_to :user

  validates :user, :event, presence: true

  validates_uniqueness_of :user_id, scope: :event_id # user cant be subscribed to the same event twice
  validates_uniqueness_of :event_id, scope: :user_id # user cant be subscribed to the same event twice

  validate :cant_subscribe_to_own_event # user can't create a subscription if event.user == current_user.id

  def to_s
    "#{user} #{event}"
  end

  protected

  def cant_subscribe_to_own_event
    return unless new_record? && user_id.present? && (user_id == event.host_id)
      errors.add(:base, 'You can not subscribe to your own event')
    end
  end
end
