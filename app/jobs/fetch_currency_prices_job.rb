class FetchCurrencyPricesJob < ApplicationJob
  queue_as :default

  def perform(currency_id)
    currency = Currency.find(currency_id) # здесь нужно два параметра?
    
    # currency = Currency.find(2, 6)
    currency.prices = PriceService.exchange_currency(currency.ticker) # здесь нужно два параметра?
    
    # currency.prices = PriceService.fetch_prices(currency.ticker)
    currency.save!
  end
end
