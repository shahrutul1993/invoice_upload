class CreateVendors < ActiveRecord::Migration[6.0]
  def change
    create_table :vendors do |t|

      t.timestamps
      t.string :name
      t.string :code
      t.string :type
    end
  end
end
