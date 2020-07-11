class Message < ApplicationRecord
  belongs_to :user
  belongs_to :channel

  validates :content, presence: true, length: { maximum: 600 }
end
