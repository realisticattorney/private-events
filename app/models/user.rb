class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :event_attendings, foreign_key: :event_attendee_id
  has_many :hosted_events, foreign_key: :host_id, class_name: 'Event'
  has_many :enrollments

  after_create :assign_default_role

  def assign_default_role
    if User.count == 1
      add_role(:admin) if roles.blank?
      add_role(:fan)
    elsif roles.blank?
      add_role(:fan)
    end
  end

  def enroll_event(event)
    enrollments.create(event: event)
  end
end
