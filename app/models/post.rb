class Post < ApplicationRecord
  belongs_to :user
  has_many :reactions, dependent: :destroy
  has_many :comments
  
  mount_uploader :photo, PhotoUploader

  validates :body, presence: true

  def likes
    count = reactions.select{|r| r.reaction_type.to_sym == :like }.size
    return count if count != 0
  end

  def hearts
    count = reactions.select{|r| r.reaction_type.to_sym == :heart }.size
    return count if count != 0
  end

  def frowns
    count = reactions.select{|r| r.reaction_type.to_sym == :frown }.size
    return count if count != 0
  end

  def comments_count
    count = comments.to_a.size
    return count if count != 0
  end
end
