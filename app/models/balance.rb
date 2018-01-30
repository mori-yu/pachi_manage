class Balance < ApplicationRecord
  validates :start, presence: true
  validates :title, presence: true

  belongs_to :user
end
