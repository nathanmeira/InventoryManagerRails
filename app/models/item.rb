class Item < ActiveRecord::Base
  validates :product_id, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true
  validates :cost, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: :cost }
end
