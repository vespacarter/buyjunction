class ScoresController < ApplicationController
	before_action :authenticate_user!

	def create
		score = Score.new
		score.score = params[:score].to_i
		score.user_id = params[:user_id].to_i
		score.description = params[:description]

		if score.save
			flash[:notice] = "Voto Enviado"
			redirect_to user_buys_path
			buy = Buy.find(params[:buy_id])
			buy.voted
			buy.save
		end
	end
end
