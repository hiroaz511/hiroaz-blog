class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :users
  validates :title, presence: true,
                    length: { minimum: 5 }
  validates :user_id, presence: true

    def user
    	return User.find_by(id: self.user_id)
    end
end