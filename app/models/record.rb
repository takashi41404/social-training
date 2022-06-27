class Record < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  def get_image
    (image.attached?) ? image : 'no_image.jpg'
  end
end
