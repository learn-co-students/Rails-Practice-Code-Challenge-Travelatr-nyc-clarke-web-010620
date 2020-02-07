class Blogger < ApplicationRecord
has_many :posts, dependent: :destroy
has_many :destinations, through: :posts 

validates :name, uniqueness: true
validates :age, numericality: {greater_than: 0}
validates :bio, length: {minimum: 30, message: "must be longer than 30 characters"}

def total_likes
    likes = self.posts.map do |post|
    post.likes
    end
    likes.sum
end 

end
