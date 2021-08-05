class User < ApplicationRecord
    belongs_to :city
    has_many :gossips
    has_many :comments
    has_secure_password
    validates :username, presence: true, uniqueness: true
    validates :password, presence: true
    has_many :likes, dependent: :destroy
end
