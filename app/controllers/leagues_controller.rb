class LeaguesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_league, only: %i[show update destroy]

  ##
  # Get Leagues based on search
  #
  def index
    @leagues = League.all
  end

  ##
  # Create a League
  #
  def create
    @league = League.new(league_params)
    if @league.save
      Tripple.create!(user_id: current_user.id, league_id: @league, role: :owner)
      render "show"
    else
      render json: @league.errors
    end
  end

  ##
  # Display League information
  #
  def show
  end

  ##
  # Update a League
  #
  def update
    if @league.update(league_params)
      render :show
    else
      render json: @league.errors
    end
  end

  ## 
  # Destroy the League Record
  #
  def destroy
    @league.destroy
    @destroy_message = "Success deleted!"
    render :show
  end

  private

    ##
    # Set @league 
    #

    def set_league
      @league = League.find(params[:id])
    end

    ##
    # Set params to a @league
    #
    def league_params
      params.fetch(:league).permit(:name)
    end
end
