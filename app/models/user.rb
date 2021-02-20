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
    self.add_role(:admin) if self.roles.blank?
    self.add_role(:fan)
  else
    self.add_role(:fan) if self.roles.blank?
  end
end

def enroll_event(event)
  self.enrollments.create(event: event)
end



end
