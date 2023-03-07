class MessagesController < ApplicationController
  before_action :set_current_user

  def set_current_user
    @current_user ||= warden.authenticate(scope: :user)
  end

  def create
    @room = Room.find(params[:room_id])
    if params[:select_msg]
      @message = current_user.messages.create(body: msg_params[:body], room: @room)

      @messages = @room.messages.order(created_at: :asc)
    elsif params[:select_exp]
      current_user.expenses.each do |expense|
        msg_expense = "Type: #{expense.expense_type}\n
        Price: #{expense.price}\n
        Name: #{expense.name}"
        @message = current_user.messages.create(body: msg_expense, room: @room)

        @messages = @room.messages.order(created_at: :asc)
      end
    end
    respond_to do |format|
      format.html { redirect_to @room }
      format.js { }
    end
  end

  private

  def msg_params
    params.require(:message).permit(:body)
  end
end
