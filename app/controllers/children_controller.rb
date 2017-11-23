class ChildrenController < ApplicationController
  before_action :find_invoices, only: [:show, :approve, :update, :edit]
  def index
    @children = Child.all
  end

  def show
  end

  def new
    @child = Child.new
  end

  def create
    @child = Child.new(child_params)
    @child.profile_id = current_user.profile.id
    if @child.save
      redirect_to profile_path(@child.profile.id)
    else
      render :new
    end
  end

  def edit
  end

  def approve
    @child.status = "Accepted"
    @child.save
    @profile = Profile.find(@child.profile_id)
    @profile.status = "Accepted"
    @profile.save
  end

  def update
    @child.update(child_params)
    redirect_to profiles_path
  end

  private
  def find_invoices
    @child = Child.find(params[:id])
  end

  def child_params
    params.require(:child).permit(:first_name, :last_name, :birthday, :section_id, :profile_id)
  end

end
