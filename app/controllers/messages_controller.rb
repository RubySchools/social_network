class MessagesController < ApplicationController

def create
	@recipient = User.find(params[:id])
	@message = Message.new()
	@message.content = params[:content]
	@message.user = current_user
	@message.save
	mes_recipient = MessageRecipient.new()
	mes_recipient.message_id = @message.id
	mes_recipient.user_id = 1
	mes_recipient.save
end
 
def show
	@message = Message.find(params[:id])
end

def index
	@messages = current_user.messages + current_user.recieved_messages
end

def update
    @message = Message.find(params[:id])

    respond_to do |format|
      if @message.update_attributes(params[:message])
        format.html { redirect_to @message, notice: 'message was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

end
