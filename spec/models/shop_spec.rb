require 'rails_helper'

describe Shop do
  describe '#create' do
    before do
      @shop = build(:shop)
    end

    it 'is valid with company_name, shop_name, image, postal_code, prefecture_id, address, business_hour, tell, user_id' do
      expect(@shop).to be_valid
    end

    it 'is invalid without company_name' do
      @shop.company_name = nil
      @shop.valid?
      expect(@shop.errors[:company_name]).to include("can't be blank")
    end

    it 'is invalid without shop_name' do
      @shop.shop_name = nil
      @shop.valid?
      expect(@shop.errors[:shop_name]).to include("can't be blank")
    end

    it 'is invalid without image' do
      @shop.image = nil
      @shop.valid?
      expect(@shop.errors[:image]).to include("can't be blank")
    end

    it 'is invalid without postal_code' do
      @shop.shop_name = nil
      @shop.valid?
      expect(@shop.errors[:shop_name]).to include("can't be blank")
    end

    it 'is invalid without hyphen' do
      @shop.postal_code = '12345678'
      @shop.valid?
      expect(@shop.errors[:postal_code]).to include('is invalid')
    end

    it 'is invalid over 7 charactors' do
      @shop.postal_code = '123-45678'
      @shop.valid?
      expect(@shop.errors[:postal_code]).to include('is invalid')
    end

    it 'is invalid less than 7 charactors' do
      @shop.postal_code = '123-456'
      @shop.valid?
      expect(@shop.errors[:postal_code]).to include('is invalid')
    end

    it 'is invalid without prefecture_id' do
      @shop.prefecture_id = nil
      @shop.valid?
      expect(@shop.errors[:prefecture_id]).to include("can't be blank")
    end

    it 'is invalid that prefecture_id is 1' do
      @shop.prefecture_id = 1
      @shop.valid?
      expect(@shop.errors[:prefecture_id]).to include('must be other than 1')
    end

    it 'is invalid without address' do
      @shop.address = nil
      @shop.valid?
      expect(@shop.errors[:address]).to include("can't be blank")
    end

    it 'is invalid without business_hour' do
      @shop.business_hour = nil
      @shop.valid?
      expect(@shop.errors[:business_hour]).to include("can't be blank")
    end

    it 'is invalid without tell' do
      @shop.tell = nil
      @shop.valid?
      expect(@shop.errors[:tell]).to include("can't be blank")
    end

    it 'is invalid over 11 characters' do
      @shop.tell = '012011112222'
      @shop.valid?
      expect(@shop.errors[:tell]).to include('is too long (maximum is 11 characters)')
    end

    it 'is valid within 11 characters' do
      @shop.tell = '07011112222'
      expect(@shop).to be_valid
    end
  end
end
