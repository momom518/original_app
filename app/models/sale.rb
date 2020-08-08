class Sale < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :shop
  belongs_to_active_hash :department

  with_options presence: true do
    validates :image
    validates :day
    validates :heading
    validates :info
    validates :start_time
    validates :end_time
    validates :caution
    validates :department_id, numericality: { other_than: 1 }
  end

end
