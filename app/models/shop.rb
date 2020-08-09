class Shop < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :user
  has_many :sales, dependent: :destroy
  has_many :bookmark, dependent: :destroy
  belongs_to_active_hash :prefecture

  with_options presence: true do
    validates :company_name
    validates :shop_name
    validates :image
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :address
    validates :start_time
    validates :end_time
    validates :tell, length: { maximum: 11 }
  end
end
