class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :prefecture_id, :city, :address1, :address2, :telephone, :order_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postcode, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :address1
    validates :telephone, format: { with: /\A\d{10,11}\z/, message: 'is invalid' }
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postcode: postcode, prefecture_id: prefecture_id, city: city, address1: address1, address2: address2,
                   telephone: telephone, order_id: order.id)
  end
end
