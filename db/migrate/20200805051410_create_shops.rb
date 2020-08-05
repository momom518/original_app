class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|
      t.string        :company_name, null: false
      t.string        :shop_name, null: false
      t.string        :postal_code, null: false
      t.integer       :prefecture_id, null: false
      t.string        :address, null: false
      t.string        :business_hour, null: false
      t.string        :tell, null: false
      t.references    :user
      t.timestamps
    end
  end
end
