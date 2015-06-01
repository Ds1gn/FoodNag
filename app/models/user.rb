class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable
         :recoverable, :rememberable, :trackable, :validatable

  has_many :purchases
  has_many :food_users
  has_many :expirations
  

end
