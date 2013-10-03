class Logo < ActiveRecord::Base

  validates_presence_of :title
  validates_presence_of :logo

  mount_uploader :logo, LogoUploader

  belongs_to :user,
    inverse_of: :logo

  has_many :reviews,
    inverse_of: :logo

  has_many :categorizations

  has_many :categories,
    through: :categorizations



end
