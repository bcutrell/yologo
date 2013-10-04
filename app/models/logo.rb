require 'state_machine'

class Logo < ActiveRecord::Base

  state_machine initial: :submitted do 
    event :approve do
      transition :submitted => :approved
    end 
    event :reject do 
      transition :submitted => :rejected
    end
  end



  validates_presence_of :title
  validates_presence_of :logo

  mount_uploader :logo, LogoUploader

  belongs_to :user,
    inverse_of: :logo

  has_many :reviews,
    inverse_of: :logo

end
