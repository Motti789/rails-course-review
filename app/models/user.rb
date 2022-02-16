class User < ApplicationRecord
 has_secure_password

 has_many :reviews
 has_many :courses, through: :reviews

 validates :name, presence: true
 validates :name, uniqueness: true

#  helpers do

#     def logged_in?
#       !!current_user
#     end

#     def current_user
#       @current_user ||= User.find_by(name: params[:user][:name])
#     end
  
# end
end