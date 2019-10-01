class PlayersController < ApplicationController
  before_action :set_player, only: %i[show update destroy]

  ##
  # Get Players based on search
  #
  def index
    @players = Player.all
  end

  ##
  # Create a Player
  #
  def create
    @player = Player.new(player_params)
    if @player.save
      render "show"
    else
      render json: @player.errors
    end
  end

  ##
  # Display Player information
  #
  def show
  end

  ##
  # Update a Player
  #
  def update
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
    @player.destroy
    @destroy_message = "Success deleted!"
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
