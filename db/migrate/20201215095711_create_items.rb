class CreateItems < ActiveRecord::Migration[6.0]
  def change

    create_table :items do |t|
      t.string      :title,           null: false
      t.integer     :price,           null: false
      t.references  :user,            foreign_key: true
      t.integer     :category_id,     null: false
      t.integer     :status_id,       null: false
      t.integer     :deliveryfee_id,  null: false
      t.integer     :state_id,        null: false
      t.integer     :shippingdate_id, null: false
      t.text        :comments,        null: false

      t.timestamps
    end
  end
end
