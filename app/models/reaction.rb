class Reaction < ApplicationRecord
  belongs_to :post
  belongs_to :user

  enum reaction_type: [:like, :heart, :frown]

  validates :post_id, uniqueness: { scope: :user_id }
end
