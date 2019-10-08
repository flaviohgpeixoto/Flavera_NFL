class TripplesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tripple, only: %i[show update destroy]

  ##
  # Get Tripple based on search
  #
  def index
    @tripple = Tripple.all
  end

  ##
  # Create a Tripple
  #
  def create
    @tripple = Tripple.new(tripple_params)
    if @tripple.save
      render "show"
    else
      render json: @tripple.errors
    end
  end

  ##
  # Display Tripple information
  #
  def show
  end

  ##
  # Update a Tripple
  #
  def update
    if @tripple.update(tripple_params)
      render :show
    else
      render json: @tripple.errors
    end
  end

  ## 
  # Destroy the Tripple Record
  #
  def destroy
    @tripple.destroy
    @destroy_message = "Success deleted!"
    render :show
  end

  private

    ##
    # Set @tripple 
    #

    def set_tripple
      @tripple = Tripple.find(params[:id])
    end

    ##
    # Set params to a @tripple
    #
    def tripple_params
      params.fetch(:tripple).permit(:user_id, :league_id, :team_id)
    end
end
