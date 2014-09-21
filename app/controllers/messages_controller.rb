class MessagesController < ApplicationController
  before_filter :authenticate_user!, except: [:new, :create]

  def new
    if current_user
      @user = User.find(params[:user])
      @message = current_user.messages.new
    else
      flash[:error] = "Please Login or Signup bto send message to the registered Traveller"
      redirect_to root_path
    end
  end
 
  def create
    @recipient = User.find(params[:user])
    current_user.send_message(@recipient, params[:body], params[:subject])
    flash[:notice] = "Message has been sent!"
    redirect_to :conversations
  end
end