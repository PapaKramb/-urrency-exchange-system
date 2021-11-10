class PriceService
  # def self.fetch_prices(ticker)
  #   # Возможно не нужно получать цену таким способом, а при обмене она сама указывается
  #   # Возможно придется добавить поле count для определения количества валюты
  #   timeseries = client
  #     .stock(symbol: ticker)
  #     .timeseries(abjusted: true, outputsize: 'compact')
  #     .output["Time Series (Daily)"]
  #     .map{ |k, v| [k, v["1. open"]]}  
  # end

  # def self.exchange_currency(ticker)
  #   exchange = client.exchange(from: ticker, to: ticker)
  # end

  # def self.client
  #   @client ||= Alphavantage::Client.new( 
  #     key: Rails.application.credentials.dig(:alphavantage, :key)
  #   )
  # end
end