class CreateCurrencies < ActiveRecord::Migration[6.1]
  def change
    create_table :currencies do |t|
      t.string :name # Bitcoin, Dollar USA
      t.string :code # BTC, USD
      t.json :prices

      t.timestamps
    end
  end
end
