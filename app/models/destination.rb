class Destination < ApplicationRecord
has_many :posts
has_many :bloggers, through: :posts

def average_age
    total_age = 0
    self.bloggers.each do |blogger|
        total_age += blogger.age
    end

    average_age = total_age / self.bloggers.count

    return average_age
end

end
