class CreateTicketLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :ticket_logs do |t|
      t.date :use_ticket_day_log
      t.integer :price
      t.string :trial
      t.integer :category_id

      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
