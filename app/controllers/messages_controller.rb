class MessagesController < ApplicationController
	before_action :authenticate_user!

	def generate
		@message = Message.new
		@message.body = params[:body]
		@message.subject = params[:subject]
		@from = User.find(params[:from])
		@to = User.find(params[:user_id])
		#@item_subject = Item.find(params[:subject])
	end

	def create
		message = Message.new(message_params)
		if message.save 
			redirect_to user_messages_path
		else
			render "generate"
		end
	end

	def show
		@user = current_user
		@message = Message.find(params[:id])
		@message.read = true
		@message.save
		@from = User.find(@message.from).username
	end


	def destroy
		message = Message.find(params[:id])
		message.destroy

		redirect_to user_messages_path
	end

  	def message_params
    	params.require(:message).permit(:user_id, :from, :subject, :body)
  	end
end
