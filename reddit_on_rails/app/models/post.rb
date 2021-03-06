class Post < ApplicationRecord
  validates :title, presence: true

  belongs_to :author,
  primary_key: :id,
  foreign_key: :author_id,
  class_name: :User

  has_many :post_subs

  has_many :comments

  has_many :subs,
    through: :post_subs,
    source: :sub

  def top_level_comments
    comments.where(parent_comment_id: nil)
  end
end
