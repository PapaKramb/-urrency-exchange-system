require 'rails_helper'
require 'pry'

RSpec.describe "Accounts", type: :request do
  before do
    sign_in @current_user = create(:user)
    @current_currency = create(:currency)
  end

  it 'index' do
    account_1 = create(:account, user: @current_user, currency: @current_currency)
    account_2 = create(:account, user: @current_user, currency: @current_currency)
    account_3 = create(:account, user: @current_user, currency: @current_currency)
    get "/users/accounts"
    expect(response).to be_ok
    expect(assigns(:accounts)).to contain_exactly(*[account_1, account_2, account_3])
  end

  it '#show' do
    account = create(:account, user: @current_user)
    get "/users/accounts/#{account.id}"
    expect(assigns(:account)).to eq account
  end

  it '#new' do 
    get '/users/accounts/new' 
    expect(assigns(:account)).to be_a_new Account 
  end

  it '#create' do
    currency = create(:currency)
    expect {
      post "/users/accounts", params: { 
        account: attributes_for(:account, currency_id: currency.id) 
        } 
      }.to change(Account, :count).by 1

    expect {
      post "/users/accounts", params: { 
        account: attributes_for(:account) 
        } 
      }.not_to change(Account, :count)

      expect(response).to be_ok
  end

  it '#edit' do 
    account = create(:account, user: @current_user) 
    get "/users/accounts/#{account.id}/edit" 
    expect(assigns(:account)).to eq account 
  end

  it '#update' do
    # переделать под пополнение балланса
    # или передавать парметры баланса для обмена, после обмена апдейт и вывод актуально баланса
    account = create(:account, user: @current_user) 
    patch "/users/accounts/#{account.id}", params: { 
      account: { 
        balance: 143.1
      } 
    }
    account.reload 
    expect(account.balance).to eq 143.1

    # patch "/users/accounts/#{account.id}", params: { 
    #   account: { 
    #     balance: 643.26
    #   }
    # }
    
    # expect(response).to be_ok
  end

  it '#destroy' do 
    account = create(:account, user: @current_user) 
    expect { delete "/users/accounts/#{account.id}" }.to change(Account, :count).by -1 
  end
end
