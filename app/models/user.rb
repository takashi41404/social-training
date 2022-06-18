class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :profile_image
  has_many :records, dependent: :destroy
  has_many :favorites, dependent: :destroy

  #フォローされる側の関係性
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followee_id", dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :follower
  #フォローする側の関係性
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followees, through: :relationships, source: :followee

  validates :name, length: { minimum: 1, maximum: 20 }, uniqueness: true
  validates :introduction, length: { maximum: 100 }

  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_profile_image.jpg'
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲスト"
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
  end

end