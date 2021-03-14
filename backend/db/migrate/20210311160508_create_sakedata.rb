class CreateSakedata < ActiveRecord::Migration[6.0]
  def change
    create_table :sakedata do |t|
      t.string :sakedata
      t.timestamps
    end
  end
end