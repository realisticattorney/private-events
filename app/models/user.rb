class User < ApplicationRecord
  rolify

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, foreign_key: :host_id, dependent: :destroy
  has_many :enrollments
  has_many :attended_events, through: :enrollments, source: :event

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
