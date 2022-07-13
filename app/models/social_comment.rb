class SocialComment < ApplicationRecord
    belongs_to :user
    belongs_to :record

    validates :comment, presence: true
end
