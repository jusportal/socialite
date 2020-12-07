class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :posts
  has_many :comments
  has_many :reactions

  validates :terms, acceptance: { message: "You must accept the terms and conditions to proceed" }
  validates :first_name, presence: true
  validates :last_name, presence: true

  mount_uploader :avatar, AvatarUploader

  def name
    "#{first_name} #{last_name}"
  end
end
