class User < ApplicationRecord
  has_many :recipes, foreign_key: 'user_id'
  has_many :foods, foreign_key: 'user_id'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  validates :name, presence: true
end
