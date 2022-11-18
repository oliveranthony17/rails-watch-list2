class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :movie_id, :list_id, :comment, presence: true
  validates  :movie_id, uniqueness: { scope: :list_id, message: "movie and list pair must be unique" }
  validates :comment, length: { minimum: 6 }
end
