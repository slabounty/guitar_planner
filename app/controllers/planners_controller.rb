# app/controllers/planners_controller.rb
class PlannersController < ApplicationController
  def new
    @planner = Current.session.user.planners.new(
      technique_bpm: 60,
      fretboard_bpm: 60,
      repertoire_bpm: 60
    )
  end

  def create
    @planner = Current.session.user.planners.build(planner_params)
    if @planner.save
      redirect_to user_home_path, notice: "Planner created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @planner = Current.session.user.planners.find(params[:id])
  end

  def update
    @planner = Current.session.user.planners.find(params[:id])
    if @planner.update(planner_params)
      redirect_to user_home_path, notice: "Planner updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    planner = Current.session.user.planners.find(params[:id])
    planner.destroy
    redirect_to user_home_path, notice: "Planner deleted successfully."
  end

  private

  def planner_params
    params.require(:planner).permit(:start_date, :technique, :technique_bpm,
                                    :fretboard, :fretboard_bpm,
                                    :repertoire, :repertoire_bpm,
                                    :note)
  end
end
