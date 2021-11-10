require 'rails_helper'

RSpec.describe ExchangeService, type: :service do 
  it "create a new exchange without client" do
    exchange = ExchangeService.client.exchange(from: "USD", to: "DKK")
    expect(exchange.class).to eq Alphavantage::Exchange
  end

  it "create a new exchange with client" do
    exchange = ExchangeService.client.exchange(from: "USD", to: "DKK")
    expect(exchange.class).to eq Alphavantage::Exchange
  end

  it "has several parameters" do
    exchange = ExchangeService.client.exchange(from: "USD", to: "DKK").now
    bool = []
    bool << (exchange.from_currency_code == "USD")
    bool << exchange.from_currency_name.is_a?(String)
    bool << (exchange.to_currency_code == "DKK")
    bool << exchange.to_currency_name.is_a?(String)
    bool << exchange.exchange_rate.is_a?(String)
    bool << exchange.last_refreshed.is_a?(String)
    bool << exchange.time_zone.is_a?(String)
    bool << exchange.output.is_a?(Hash)
    expect(bool.all?{|e| e}).to eq true
  end
end