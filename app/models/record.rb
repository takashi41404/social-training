class Record < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :social_comments, dependent: :destroy

  def get_image
    (image.attached?) ? image : 'no_image.jpg'
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def self.search_for(content, method)
    if method == 'perfect'
      Record.where(title: content)
    elsif method == 'forward'
      Record.where('title LIKE ?', content+'%')
    elsif method == 'backward'
      Record.where('title LIKE ?', '%'+content)
    else
      Record.where('title LIKE ?', '%'+content+'%')
    end
  end

end
