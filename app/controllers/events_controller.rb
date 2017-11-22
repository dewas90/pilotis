class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    create_event
    if @event.save
      flash[:notice] = "Event successfully created"
      UserMailer.event(@event.profile_id.user).deliver_now
      redirect_to event_path(@event)
    else
      flash[:notice] = "Event not created"
      render :new
    end
  end

  def edit
  end

  def update
    @event.update(event_params)
    redirect_to event_path(@event)
  end

  def destroy
    @event.destroy
    redirect_to events_path
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def create_event
    Profile.where(section_id: event_params[:section_id]).each do |profile|
      if profile.user != current_user
        @event = Event.new(event_params)
        @event.admin = current_user.profile.admin
        @event.profile_id = profile.id
        if @event.save
          @event.save
          UserMailer.event(Profile.find(@event.profile_id).user, @event).deliver_now
        else
          render :new
        end
      end
    end
  end

  def event_params
    params.require(:event).permit(:name, :start_time, :end_time, :admin_id, :section_id, :profile_id)
  end
end
