class Category < ActiveRecord::Base
    Industries = [
  "Basic Materials",
  "Conglomerates",
  "Consumer Goods",
  "Financial",
  "Healthcare",
  "Industrial Goods",
  "Services",
  "Technology",
  "Utilities" ]

  has_many :categorizations

  has_many :logos,
    through: :categorizations



  validates_presence_of :name
  validates_inclusion_of :name, in: Industries


end
