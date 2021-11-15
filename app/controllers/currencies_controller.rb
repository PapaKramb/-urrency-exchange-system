class CurrenciesController < ApplicationController
  def index
    @currencies = Currency.all
  end
  
  def new
    # тоже только для админа
    @currency = Currency.new
  end

  def show
    # показывать список всех актуальных для обмена валют
    @currency = Currency.find(params[:id])
  end

  def create
    # возможно лишнее, либо модифицировать метод, чтобы он брал и отображал валюты(хотя для этого есть метод show)
    # или сделать чтобы только админ мог создавать новые валюты?
    @currency = Currency.new(currency_params)

    if @currency.save
      redirect_to @currency
    else
      render :new
    end
  end

  def edit
    @currency = Currency.find(params[:id])
  end

  def update
    @currency = Currency.find(params[:id])

    if @currency.update(currency_params)
      redirect_to @currency
    else
      render :edit
    end
  end

  def destroy
    @currency = Currency.find(params[:id])

    if @currency.destroy
      redirect_to currencies_path
    end
  end

  private

  def currency_params
    params.require(:currency).permit(:name, :code, :prices)
  end
end
