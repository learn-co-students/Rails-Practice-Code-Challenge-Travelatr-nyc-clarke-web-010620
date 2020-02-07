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

def top_post
    tp = self.posts.order(:likes).first
end 

def tf_dests
    dest_frequencies = Hash.new 
    self.destinations.each do |dn| 
        if dest_frequencies[dn] 
        dest_frequencies[dn] += 1
        else 
        dest_frequencies[dn]= 1    
        end
    end  
    dest_frequencies
end  

def tf_names
    dests = self.tf_dests.keys 
    dests.map{|d| "#{d.name} : #{d.country}"}
end 


end
