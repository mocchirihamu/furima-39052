class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :shopping_date

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
   validates :image
   validates :name
   validates :detail
   validates :category_id, numericality: { other_than: 1 , message: "can't be blank"} 
   validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"} 
   validates :delivery_charge_id, numericality: { other_than: 1 , message: "can't be blank"} 
   validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"} 
   validates :shopping_date_id, numericality: { other_than: 1 , message: "can't be blank"} 
   validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999}, format: { with: /\A[0-9]+\z/ }
  end
end
