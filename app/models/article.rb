class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  validates :title, presence: true,
                    length: { minimum: 5 }
  validates :user_id, presence: true

  # scope :newer, -> { order(created_at: :desc) }
    def user
    	return User.find_by(id: self.user_id)
    end
end