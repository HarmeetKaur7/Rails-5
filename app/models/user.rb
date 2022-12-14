class User < ApplicationRecord
    has_many :articles
    before_save  {self.email= email.downcase}
    validates :username ,presence: true,
              uniqueness: {case_sensitive: false} ,
              length:{minimum:3,maximum:25}
    REGEX_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email,presence: true, 
              uniqueness: {case_sensitive: false},
              length:{maximum:50},
              format:{with: REGEX_EMAIL}
    has_secure_password
   
end
