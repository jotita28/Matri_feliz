# Controlador que maneja la logica de compra de servicios
class BillingsController < ApplicationController
  before_action :authenticate_user!
  authorize_resource
  def pre_pay
    bookings = current_user.bookings.where(payed: false)
    total = bookings.where(nil).map { |booking| booking.price }.sum
    items = bookings.map do |booking| 
      item = {}
      item[:name] = booking.service.todo.name,
      item[:service_name] = booking.service.name,
      item[:sku] = booking.service.id.to_s,
      item[:price] = booking.price.to_s,
      item[:currency] = 'USD',
      item[:quantity] = 1
      item
    end
    payment = PayPal::SDK::REST::Payment.new({
      :intent =>  "sale",
      :payer =>  {
        :payment_method =>  "paypal" },
      :redirect_urls => {
        :return_url => execute_billings_url,
        :cancel_url => "http://localhost:3000/" },
      :transactions =>  [{
        :item_list => {
          :items => items},
        :amount =>  {
          :total =>  total.to_s,
          :currency =>  "USD" },
        :description =>  "This is the payment transaction description." }]})

    if payment.create
      redirect_url = payment.links.find{|v| v.method == "REDIRECT" }.href
      redirect_to redirect_url
    else
      payment.error
    end
  end

  def execute
    paypal_payment = PayPal::SDK::REST::Payment.find(params[:paymentId])
    if paypal_payment.execute(payer_id: params[:PayerID])
      total = paypal_payment.transactions.first.amount.total
      billing = Billing.create(
        user_id: current_user.id,
        code: paypal_payment.id,
        payment_method: 'paypal',
        amount: total.to_i,
        currency: 'USD'
        )
      bookings = current_user.bookings.where(payed: false)
      bookings.update_all(payed: true, billing_id: billing.id)
      redirect_to detail_billings_path, notice: 'El pago se generó con éxito!'
    else
      render plain: 'Error al efectuar el pago, intente nuevamente'
    end
  end

  def detail
    @billing = Billing.last
    @bookings = current_user.bookings.where(payed: true).where(billing_id: @billing.id)
  end

  def mis_compras
    @bookings = current_user.bookings.where(payed: true)
  end
end
