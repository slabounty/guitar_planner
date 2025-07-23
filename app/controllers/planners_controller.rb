# app/controllers/planners_controller.rb
class PlannersController < ApplicationController
  def new
    @planner = Planner.new
  end

  def create
    @planner = Current.session.user.planners.build(planner_params)
    if @planner.save
      redirect_to user_home_path, notice: "Planner created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    planner = Current.session.user.planners.find(params[:id])
    planner.destroy
    redirect_to user_home_path, notice: "Planner deleted successfully."
  end

  private

  def planner_params
    params.require(:planner).permit(:start_date, :technique, :fretboard, :repertoire)
  end
end
