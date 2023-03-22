require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  context '商品が購入できる場合' do
    it "全ての入力項目が存在すれば購入できる" do
      expect(@order_address).to be_valid
    end
    it '建物番号が空でも登録できる' do
      @order_address.address2 = ''
      expect(@order_address).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it "郵便番号が空では購入できない" do
      @order_address.postcode = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postcode can't be blank")
    end
    it "郵便番号にハイフンがないと購入できない" do
      @order_address.postcode = '1112233'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postcode is invalid")
    end
    it "郵便番号が全角では購入できない" do
      @order_address.postcode = "１１１２２３３"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postcode is invalid")
    end
    it "都道府県が空では購入できない" do
      @order_address.prefecture_id = 1
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
    end
    it "市区町村が空では購入できない" do
      @order_address.city = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end
      it "番地が空では購入できない" do
        @order_address.address1 = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address1 can't be blank")
      end
      it "電話番号が空では購入できない" do
        @order_address.telephone = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone can't be blank")
      end
      it "電話番号が全角では購入できない" do
        @order_address.telephone = "０８０１１１１２２２２"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone is invalid")
    end
    it "電話番号が12桁以上では購入できない" do
      @order_address.telephone = "080111122223"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Telephone is invalid")
    end
  end
end
