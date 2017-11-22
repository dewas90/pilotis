class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update]

  def index
    @profiles = Profile.all
      respond_to do |format|
      format.html
      format.xlsx {
        response.headers['Content-Disposition'] = 'attachment; filename="all_profiles.xlsx"'
      }
    end
  end


  def show
    @events = Event.all
    @invoices = Invoice.all
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    if @profile.save
      redirect_to profile_path(@profile)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @profile.update(profile_params)
    redirect_to profile_path(@profile)
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :totem, :birth_date, :address, :zip_code, :city, :country, :phone_number, :photo, :gender, :comment)
  end

  def set_profile
    @profile = Profile.find(params[:id])
  end
end
