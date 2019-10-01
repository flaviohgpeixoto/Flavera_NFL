class AdminsBackoffice::AdminsController < AdminsBackofficeController
  before_action :set_admin, only: %i[show update destroy]

  ##
  # Get Admins based on search
  #
  def index
    @admins = Admin.all
  end

  ##
  # Create a Admin
  #
  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      render "show"
    else
      render json: @admin.errors
    end
  end

  ##
  # Display Admin information
  #
  def show
  end

  ##
  # Update a Admin
  #
  def update
    if @admin.update(admin_params)
      render :show
    else
      render json: @admin.errors
    end
  end

  ## 
  # Destroy the Admin Record
  #
  def destroy
    @admin.destroy
    @destroy_message = "Success deleted!"
    render :show
  end

  private

    ##
    # Set @admin
    #

    def set_admin
      @admin = Admin.find(params[:id])
    end

    ##
    # Set params to a @admin
    #
    def admin_params
      params.fetch(:admin).permit(:name, :email, :password, :password_confirmation)
    end
end
