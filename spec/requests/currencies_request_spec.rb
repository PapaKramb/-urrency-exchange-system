require 'rails_helper'
require 'pry'

RSpec.describe "Currencies", type: :request do
  before do
    sign_in @current_user = create(:user)
  end

  it 'index' do
    currency_1 = create(:currency, code: "USD")
    currency_2 = create(:currency, code: "CNY")
    currency_3 = create(:currency, code: "RUB")
    get "/currencies"
    expect(response).to be_ok
    expect(assigns(:currencies)).to contain_exactly(*[currency_1, currency_2, currency_3])
  end

  it '#show' do
    currency = create(:currency)
    get "/currencies/#{currency.id}"
    expect(assigns(:currency)).to eq currency
  end

  it '#new' do
    # Рефокторинг - нужно сделать так, чтобы валюту мог создать/добавить только админ 
    get '/currencies/new' 
    expect(assigns(:currency)).to be_a_new Currency 
  end

  it '#create' do 
    expect { 
      post '/currencies', params: { 
        currency: attributes_for(:currency) 
        } 
      }.to change(Currency, :count).by 1 
  end

  it '#edit' do
    # Рефокторинг - нужно сделать так, чтобы валюту мог редактировать только админ 
    currency = create(:currency) 
    get "/currencies/#{currency.id}/edit" 
    expect(assigns(:currency)).to eq currency 
  end

  it '#update' do 
    currency = create(:currency) 
    patch "/currencies/#{currency.id}", params: { 
      currency: { 
        name: 'Russian Ruble',
        code: 'RUB' 
      } 
    } 
    expect(currency.reload.name).to eq 'Russian Ruble'
    expect(currency.reload.code).to eq 'RUB' 
  end

  it '#destroy' do
    # Рефокторинг - нужно сделать так, чтобы валюту мог удалять только админ 
    currency = create(:currency) 
    expect { delete "/currencies/#{currency.id}" }.to change(Currency, :count).by -1 
  end
end
