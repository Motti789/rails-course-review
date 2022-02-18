class Review < ApplicationRecord
  belongs_to :user
  belongs_to :course

  validates :title, :comment, presence: true


  scope :alpha, -> {order('title')}
  scope :latest_reviews, -> {order(created_at: :desc)}

end