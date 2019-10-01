class UsersController < ApplicationController
  before_action :set_User, only: %i[show update destroy]

  ##
  # Get Users based on search
  #
  def index
    @users = User.all
  end

  ##
  # Create a User
  #
  def create
    @user = User.new(user_params)
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
  end

  ##
  # Update a User
  #
  def update
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
      params.fetch(:user).permit(:name, :nickname, :email, :password, :password_confirmation)
    end
end
