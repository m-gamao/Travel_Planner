class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :trips
  has_many :destinations, through: :trips

  devise :omniauthable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :email,  uniqueness: true
         validates :password,  presence: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.provider = auth.provider
    #user.name = auth.info.name
    user.uid = auth.uid
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    end
  end
  
end
