require 'rails_helper'
describe Shop do
  describe '#create' do
    before do
      @sale = build(:sale)
    end

    it 'is valid with image, heading, info, caution, day, start_time, end_time, shop_id, department_id' do
      expect(@sale).to be_valid
    end

    it 'is invalid without image' do
      @sale.image = nil
      @sale.valid?
      expect(@sale.errors[:image]).to include("can't be blank")
    end

    it 'is invalid without heading' do
      @sale.heading = nil
      @sale.valid?
      expect(@sale.errors[:heading]).to include("can't be blank")
    end

    it 'is invalid without info' do
      @sale.info = nil
      @sale.valid?
      expect(@sale.errors[:info]).to include("can't be blank")
    end

    it 'is invalid without caution' do
      @sale.caution = nil
      @sale.valid?
      expect(@sale.errors[:caution]).to include("can't be blank")
    end

    it 'is invalid without day' do
      @sale.day = nil
      @sale.valid?
      expect(@sale.errors[:day]).to include("can't be blank")
    end
    
    it 'is invalid without start_time' do
      @sale.start_time = nil
      @sale.valid?
      expect(@sale.errors[:start_time]).to include("can't be blank")
    end

    it 'is invalid without end_time' do
      @sale.end_time = nil
      @sale.valid?
      expect(@sale.errors[:end_time]).to include("can't be blank")
    end

    it 'is invalid without department_id' do
      @sale.department_id = 1
      @sale.valid?
      expect(@sale.errors[:department_id]).to include("must be other than 1")
    end

  end
end