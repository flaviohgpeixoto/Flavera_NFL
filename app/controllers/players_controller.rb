# frozen_string_literal: true

##
# This controller manage CRUD for Players. It uses policies to define users' authorization
#
class PlayersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_player, only: %i[show update destroy]

  ##
  # Get Players based on search
  #
  def index
    @players = Player.all
    authorize @players
  end

  ##
  # Create a Player
  #
  def create
    @player = Player.new(player_params)
    authorize @player
    if @player.save
      render 'show'
    else
      render json: @player.errors
    end
  end

  ##
  # Display Player information
  #
  def show
    authorize @player
  end

  ##
  # Update a Player
  #
  def update
    authorize @player
    if @player.update(player_params)
      render :show
    else
      render json: @player.errors
    end
  end

  ##
  # Destroy the Player Record
  #
  def destroy
    authorize @player
    @player.destroy
    @destroy_message = 'Success deleted!'
    render :show
  end

  private

  ##
  # Set @player
  #
  def set_player
    @player = Player.find(params[:id])
  end

  ##
  # Set params to a @player
  #
  def player_params
    params.fetch(:player).permit(:name, :position, :team_id)
  end
end
