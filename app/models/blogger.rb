class Blogger < ApplicationRecord
has_many :posts
has_many :destinations, through: :posts

validates :name, uniqueness: true
validates :age, numericality: { greater_than_or_equal_to: 0}
validates :bio, length: {minimum:30}

def total_likes
    likes = 0
    self.posts.each do |post|
        likes += post.likes
    end
    likes
end

def most_liked_post
    new_array = self.posts.sort_by {|post| post.likes}
    return new_array.last
end

end
