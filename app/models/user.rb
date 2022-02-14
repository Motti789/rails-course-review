class User < ApplicationRecord
 has_secure_password

 has_many :reviews
 has_many :courses, through: :reviews

 validates :name, presence: true
 validates :name, uniqueness: true
end