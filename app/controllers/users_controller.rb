class UsersController < ApplicationController
  before_action :authenticate_user!, except: %i[create]
  before_action :set_user, only: %i[show update destroy]

  ##
  # Get Users based on search
  #
  def index
    @users = User.all
    authorize @users
  end

  ##
  # Create a User
  #
  def create
    @user = User.new(user_params)
    authorize @user
    if @user.save
      render "show"
    else
      render json: @user.errors
    end
  end

  ##
  # Display User information
  #
  def show
    authorize @user
  end

  ##
  # Update a User
  #
  def update
    authorize @user
    if @user.update(user_params)
      render :show
    else
      render json: @user.errors
    end
  end

  ## 
  # Destroy the User Record
  #
  def destroy
    authorize @user
    @user.destroy
    @destroy_message = "Success deleted!"
    render :show
  end

  private

    ##
    # Set @user
    #

    def set_user
      @user = User.find(params[:id])
    end

    ##
    # Set params to a @user
    #
    def user_params
      params.fetch(:user).permit(:name, :nickname, :email, :password, :password_confirmation, :role)
    end
end
