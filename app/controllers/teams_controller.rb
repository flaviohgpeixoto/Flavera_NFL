class TeamsController < ApplicationController
  before_action :set_team, only: %i[show update destroy]

  ##
  # Get Teams based on search
  #
  def index
    @teams = Team.all
  end

  ##
  # Create a Team
  #
  def create
    @team = Team.new(team_params)
    if @team.save
      render "show"
    else
      render json: @team.errors
    end
  end

  ##
  # Display Team information
  #
  def show
  end

  ##
  # Update a Team
  #
  def update
    if @team.update(team_params)
      render :show
    else
      render json: @team.errors
    end
  end

  ## 
  # Destroy the Team Record
  #
  def destroy
    @team.destroy
    @destroy_message = "Success deleted!"
    render :show
  end

  private

    ##
    # Set @team 
    #

    def set_team
      @team = Team.find(params[:id])
    end

    ##
    # Set params to a @team
    #
    def team_params
      params.fetch(:team).permit(:name)
    end
end

