class ChildrenController < ApplicationController
  def index
    @childre = Child.all
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

  def update
  end

  private

  def child_params
    params.require(:child).permit(:first_name, :last_name, :birth_date, :section_id)
  end

end
