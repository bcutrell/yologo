class Categorization < ActiveRecord::Base
  belongs_to :logo
  belongs_to :category

  validates_presence_of :logo_id
  validates_presence_of :category_id
  validates_numericality_of :category_id
  validates_numericality_of :logo_id
end
