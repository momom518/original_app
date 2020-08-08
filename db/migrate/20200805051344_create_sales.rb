class CreateSales < ActiveRecord::Migration[6.0]
  def change
    create_table :sales do |t|
      t.references       :shop, null:false
      t.integer          :department_id, null:false
      t.text             :heading, null:false
      t.text             :info, null:false
      t.text             :caution, null:false
      t.date             :day, null:false
      t.time             :start_time, null:false
      t.time             :end_time, null:false
      t.text             :image
      t.timestamps
    end
  end
end
