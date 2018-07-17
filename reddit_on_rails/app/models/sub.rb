class Sub < ApplicationRecord
  validates :title, :description, presence: true

  belongs_to :moderator,
  primary_key: :id,
  foreign_key: :moderator_id,
  class_name: :User

  has_many :post_subs

  has_many :posts,
    through: :post_subs,
    source: :post
end
