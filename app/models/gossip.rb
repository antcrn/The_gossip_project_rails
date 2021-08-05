class Gossip < ApplicationRecord
    belongs_to :user
     validates :title, presence: true
     validates :content, presence: true
     has_many :comments
     has_many :likes, dependent: :destroy

end
