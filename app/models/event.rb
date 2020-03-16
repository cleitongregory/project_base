class Event < ActiveRecord::Base

  validates :dated_at, presence: true

  belongs_to :user
end
