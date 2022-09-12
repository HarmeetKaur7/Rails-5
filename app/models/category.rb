class Category < ApplicationRecord
    validates :name , presence: true, 
    uniqueness: true,
    length: {maximum: 15, minimum:4}
end
