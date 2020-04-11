class Comment < ApplicationRecord
  validates :text, presence: true
  belongs_to :user
  has_many :posts

  def self.search(search)
    return Comment.all unless search
    Comment.where('text LIKE(?)', "%#{search}%")
  end
end
