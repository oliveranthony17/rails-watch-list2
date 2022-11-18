class Movie < ApplicationRecord
  has_many :bookmarks
  before_destroy :check_for_bookmarks

  validates :title, :overview, :poster_url, :rating, presence: true
  validates :title, :overview, uniqueness: true

  def check_for_bookmarks
    if bookmarks.count > 0
      errors.add_to_base("cannot delete movie while included in bookmark")
      return false
    end
  end

end
