class Api::V1::BuysController < ApplicationController
	def setpayment
		buy = Buy.find(params[:id])
		buy.set_payment
		buy.save
		render :nothing => true, :status => 204
	end

	def paymentconfirm
		buy = Buy.find(params[:id])
		buy.paymentconfirm
		buy.save
		buy.check_confirmed_payments
		render :nothing => true, :status => 204
	end

	def setitem
		buy = Buy.find(params[:id])
		buy.set_item
		buy.save
		render :nothing => true, :status => 204
	end

	def itemconfirm
		buy = Buy.find(params[:id])
		buy.itemconfirm
		buy.save
		buy.check_confirmed_items
		render :nothing => true, :status => 204
	end
end