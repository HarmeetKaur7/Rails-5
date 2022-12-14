class Article < ApplicationRecord
    scope :newest, ->{where('created_at > ?', 1.day.ago).limit(5)}
    belongs_to :user
    validates :title, presence: true,length:{minimum:6,maximum:50}
    validates :description, presence: true,length:{minimum:10,maximum:300}
    end