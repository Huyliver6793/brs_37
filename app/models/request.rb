class Request < ApplicationRecord
  extend DatabaseQuery
  belongs_to :user

  delegate :name, to: :user

  validates :title, presence: true, length: {maximum: 50}
  validates :content, presence: true, length: {minimum: 50}
end
