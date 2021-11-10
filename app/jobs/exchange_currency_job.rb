class ExchangeCurrencyJob < ApplicationJob
  queue_as :default

  def perform(currency_id)
    currency = Currency.find(currency_id) # здесь нужно два параметра?
    
    # currency = Currency.find(2, 6)
    currency.prices = ExchangeService.exchange_currency(currency.ticker) # здесь нужно два параметра?
    currency.save!
  end
end
