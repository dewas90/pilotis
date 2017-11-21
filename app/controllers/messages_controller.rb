class MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
  end

  def create
    create_message
    if @message.save
      flash[:notice] = "Message successfully created"
      redirect_to messages_path
    else
      flash[:notice] = "Message not created"
      render :new
    end
  end

  private

  def set_message
    @message = Message.find(params[:id])
  end

  def create_message
    Profile.where(section_id: message_params[:section_id]).each do |profile|
      if profile.user != current_user
        @message = Message.new(message_params)
        @message.admin = current_user.profile.admin
        @message.profile = profile
        if @message.save
          @message.save
          UserMailer.custom_message(@message.profile.user, @message).deliver_now
        else
          render :new
        end
      end
    end
  end

  def message_params
    params.require(:message).permit(:profile_id, :subject, :body, :admin_id, :section_id)
  end
end
