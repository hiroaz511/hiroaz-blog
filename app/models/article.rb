class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :user
  validates :title, presence: true,
                    length: { minimum: 5 }
  validates :user_id, presence: true


    def like_user(user_id)
    	likes.create(user_id: user_id)
    end

  # いいねを解除する
	def unlike_user(user_id)
	    likes.find_by(user_id: user_id).destroy
    end

  # scope :newer, -> { order(created_at: :desc) }
    def user
    	return User.find_by(id: self.user_id)
    end
end