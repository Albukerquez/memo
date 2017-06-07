class User < ApplicationRecord
  has_many :posts, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_save { |user| user.user_name = user.user_name.downcase }

  validates :user_name, presence: true, length: { minimum: 4, maximum: 16 }
end
