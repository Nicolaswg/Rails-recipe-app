class User < ApplicationRecord
  has_many :recipes, foreign_key: 'user_id', class_name: 'Recipe'
  has_many :foods, foreign_key: 'user_id', class_name: 'Food'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
end
