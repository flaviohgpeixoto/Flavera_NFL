# frozen_string_literal: true

##
# This controller manage CRUD for Teams. It uses policies to define users' authorization
#
class TeamsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_team, only: %i[show update destroy]

  ##
  # Get Teams based on search
  #
  def index
    @teams = Team.all
    authorize @teams
  end

  ##
  # Create a Team
  #
  def create
    @team = Team.new(team_params)
    authorize @team
    if @team.save
      render 'show'
    else
      render json: @team.errors
    end
  end

  ##
  # Display Team information
  #
  def show
    authorize @team
  end

  ##
  # Update a Team
  #
  def update
    authorize @team
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
    authorize @team
    @team.destroy
    @destroy_message = 'Success deleted!'
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
