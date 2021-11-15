class AccountsController < ApplicationController
  def index
    @accounts = Account.all
  end

  def show
    @account = Account.find(params[:id])
  end
  
  def new
    @account = Account.new
  end

  def create
    @account = current_user.accounts.create(account_params)

    if @account.save
      redirect_to users_account_path(@account)
    else
      render :new
    end
  end

  def edit
    @account = Account.find(params[:id])
  end

  def update
    # пополнение баланса?
    # после обмена валюты, обновлять баланс аккаунта на актуальный
    @account = Account.find(params[:id])

    if @account.update(account_params)
      redirect_to users_account_path(@account)
    else
      render :edit
    end
  end

  def destroy
    @account = Account.find(params[:id])

    if @account.destroy
      redirect_to users_accounts_path
    end
  end

  private

  def account_params
    params.require(:account).permit(:balance, :currency_id)
  end
end
