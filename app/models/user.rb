class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :password,        length: { minimum: 6 }, confirmation: true,  format: { with: /\A[a-zA-Z0-9]+\z/ }, on: :create
  
         with_options presence: true do      
           validates :name        
           validates :profile
           validates :department
         end
         has_one_attached :user_image
  has_many :recipes, dependent: :destroy

 

end
