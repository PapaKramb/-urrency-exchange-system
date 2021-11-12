class ExchangeService
  def self.exchange_currency(code)
    # Возможно придется добавить поле count для определения количества валюты
    # Или в моделе или контроллере Exchange(s) брать количество из Account(s)(счета) и мержить с параметрами этого сервиса
    exchange = client.exchange(from: code, to: code)
  end

  def self.client
    @client ||= Alphavantage::Client.new( 
      key: Rails.application.credentials.dig(:alphavantage, :key)
    )
  end
end