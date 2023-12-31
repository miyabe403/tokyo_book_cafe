# frozen_string_literal: true

class Admin::CustomersController < ApplicationController
  before_action :get_customer_id, only: [:show, :edit, :update]
 
  def index 
    @customers = Customer.page(params[:page])
  end
  
  def order
    @customer = Customer.find(params[:id])
    @orders = @customer.orders.order(created_at: :desc).page(params[:page]).per(10)
  end

  def show
  end

  def edit
  end
  
  def update
    @original_customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "会員情報の編集に成功しました。"
      flash[:color] = "text-success"
      redirect_to admin_customer_path(@customer)
    else
    # エラー箇所に元のデータを代入する
      @original_customer.attributes.each do |attr, value|
        @customer[attr] = value unless @customer.errors[attr].empty?
    end
      flash[:notice] = "会員情報の編集に失敗しました。"
      flash[:color] = "text-danger"
      render :edit
    end
  end
  
  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number, :email, :is_active)
  end

  def get_customer_id
    @customer = Customer.find(params[:id])
  end
end
