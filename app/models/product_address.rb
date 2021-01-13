class ProductAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_area_id, :municipality, :address, :building_name, :phone_number, :product_id, :user_id, :sell_id, :token
  
  with_options presence: true do
    #郵便番号
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/ }
    #市区町村
    validates :municipality
    #番地
    validates :address
    #電話番号
    validates :phone_number, format: {with: /\A\d{10}\z|\A\d{11}\z/ }
    #都道府県
    validates :shipping_area_id, numericality: { other_than: 1 }
    validates :user_id
    validates :sell_id
    validates :token
  end
  

  def save
    # 各テーブルにデータを保存する処理を書く
    product = Product.create(user_id: user_id, sell_id: sell_id)
    Address.create(postal_code: postal_code, municipality: municipality, address: address, phone_number: phone_number, shipping_area_id: shipping_area_id, building_name: building_name, product_id: product.id)
  end
end
