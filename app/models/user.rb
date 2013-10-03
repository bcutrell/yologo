class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader

  has_many :votes,
    inverse_of: :user    

  has_many :reviews,
    inverse_of: :user

  has_many :logos,
    inverse_of: :user

  validates_presence_of :username

end
