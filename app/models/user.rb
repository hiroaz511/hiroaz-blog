class User < ApplicationRecord
	belongs_to :article
	validates :name, presence: true
	validates :email, {uniqueness: true}
	validates :password, presence: true
end
