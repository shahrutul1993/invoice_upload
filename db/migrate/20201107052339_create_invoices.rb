class CreateInvoices < ActiveRecord::Migration[6.0]
  def change
    create_table :invoices do |t|
      t.integer :invoice_num
      t.string :type
      t.integer :document_number
      t.date :due_date
      t.date :doc_date
      t.float :amount
      t.date :posting_date

      t.timestamps
    end
  end
end
