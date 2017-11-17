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
      redirect_to event_path(@event)
    else
      flash[:notice] = "Event not successfully created"
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
    Profile.all.each do |profile|
      if profile.user != current_user
        @event = Event.new(event_params)
        @event.admin = current_user.profile.admin
      end
    end
  end

  def event_params
    params.require(:event).permit(:name, :start_time, :end_time, :admin_id)
  end
end
