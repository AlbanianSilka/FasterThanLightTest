class MessagesController < ApplicationController
  def create
    if params[:select_msg]
      @message = current_user.messages.create(body: msg_params[:body], room_id: params[:room_id])
    elsif params[:select_exp]
      current_user.expenses.each do |expense|
        msg_expense = "Type: #{expense.expense_type}\n
        Price: #{expense.price}\n
        Name: #{expense.name}"
        @message = current_user.messages.create(body: msg_expense, room_id: params[:room_id])
      end
    end
  end

  private

  def msg_params
    params.require(:message).permit(:body)
  end
end
