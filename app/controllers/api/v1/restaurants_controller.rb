class Api::V1::RestaurantsController < Api::V1::BaseController
  # to identify the user by its token
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  before_action :find_restaurant, only: %i[ show update destroy ]

  def index
    # @restaurants = PUNDIT(Restaurant.all)
    @restaurants = policy_scope(Restaurant)
  end

  def show; end

  def update
    if @restaurant.update(restaurant_strong_params)
      render :show
    else
      render_errors
    end
  end

  def create
    @restaurant = Restaurant.new(restaurant_strong_params)
    @restaurant.user = current_user
    authorize @restaurant
    if @restaurant.save
      render :show, status: :created
    else
      render_errors
    end
  end

  def destroy
    @restaurant.destroy
    head :no_content
  end

  private

  def render_errors
    render json: { errors: @restaurant.errors.full_messages },
    status: :unprocessable_entity
  end
  
  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant
  end

  def restaurant_strong_params
    params.require(:restaurant)
          .permit(:name, :address)
  end

end
