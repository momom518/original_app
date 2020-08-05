class CreateSales < ActiveRecord::Migration[6.0]
  def change
    create_table :sales do |t|
      t.references       :shop
      t.references       :user
      t.string           :heading
      t.text             :info
      t.text             :caution
      t.date             :day
      t.datetime         :start_time
      t.datetime         :end_time
      t.text             :image
      t.timestamps
    end
  end
end
