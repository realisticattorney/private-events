class Event < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 5 }
  validates :date, presence: true

  belongs_to :host, class_name: :User, foreign_key: :host_id
  has_many :enrollments, dependent: :destroy
  has_many :attendees, through: :enrollments, source: :user

  def to_s
    title
  end

  scope :upcoming, -> { where('date > ?', Time.now) }
  scope :past, -> { where('date < ?', Time.now) }
end
