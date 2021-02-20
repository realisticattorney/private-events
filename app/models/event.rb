class Event < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 5 }

  belongs_to :host, class_name: 'User', foreign_key: :host_id
  has_many :enrollments

  def to_s
    title
  end

  # def enrolled(user)
  #     self.enrollments.where(host_id: [user.id], event_id: [self.id]).empty?
  #   end
end
