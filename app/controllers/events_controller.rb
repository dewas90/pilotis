class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_section_ids, only: [:create]
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
    @event = Event.new
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @section_ids.each do |id|
      @success = create_event(id)
      break unless @success
    end
    if @event.save
      flash[:notice] = "Event successfully created"
      UserMailer.event(Profile.find(@event.profile_id).user, @event).deliver_now
      redirect_to events_path
    else
      flash[:notice] = "Event not created"
      render :new
    end
  end

  def edit
  end

  def update
    @event.update(event_params)
    redirect_to events_path
  end

  def destroy
    @event.destroy
    redirect_to events_path
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def create_event(section_id)
    success = true
    Profile.where(section_id: section_id).each do |profile|
      if profile.user != current_user
        @event = Event.new(event_params)
        @event.admin = current_user.profile.admin
        @event.profile_id = profile.id
      end
    end
    success
  end

  def set_section_ids
    @section_ids = params.require(:sections)["section_ids"].reject { |x| x.blank? }
  end

  def event_params
    params.require(:event).permit(:name, :start_time, :end_time, :admin_id, :profile_id, :section)
  end
end
