class CreateExcavators < ActiveRecord::Migration[6.0]
  def change
    create_table :excavators do |t|
      t.string :company_name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.boolean :crew_onsite
      t.references :ticket

      t.timestamps
    end
  end
end
