class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_action :check_user, only: [:edit, :update, :destroy]
  
  # GET /trips
  # GET /trips.json
  
  def search
    @languages = Trip.pluck(:language).uniq
    @interests = Trip.pluck(:interests).uniq
    @destinations = Trip.pluck(:destination).uniq
    @filters = params.slice(:language,:interests)
    @search_param = params[:search]
    @language_param = params[:language]
    @intersts_param = params[:interests]

    if params[:search].present?
      @trips = Trip.where("destination LIKE :destination",  {:destination=> "%#{params[:search]}%"}).where(@filters)
    else
      @trips = Trip.where(@filters).paginate(:page => params[:page], :per_page => 10)
    end
  end

  def index
    @trips = Trip.where(@filters)
    @languages = Trip.pluck(:language).uniq
    @interests = Trip.pluck(:interests).uniq
    @destinations = Trip.pluck(:destination).uniq
  end

  # GET /trips/1
  # GET /trips/1.json
  def show
    @comments = Comment.where(trip_id: @trip.id)
  end

  # GET /trips/new
  def new
    @trip = Trip.new
  end

  # GET /trips/1/edit
  def edit
  end

  # POST /trips
  # POST /trips.json
  def create
    trip_params["destination"].downcase!
    trip_params["language"].downcase!
    trip_params["interests"].downcase!
    @trip = Trip.new(trip_params)
    @trip.user_id = current_user.id

    respond_to do |format|
      if @trip.save
        format.html { redirect_to @trip, notice: 'Trip was successfully created.' }
        format.json { render :show, status: :created, location: @trip }
      else
        format.html { render :new }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trips/1
  # PATCH/PUT /trips/1.json
  def update
    respond_to do |format|
      if @trip.update(trip_params)
        format.html { redirect_to @trip, notice: 'Trip was successfully updated.' }
        format.json { render :show, status: :ok, location: @trip }
      else
        format.html { render :edit }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trips/1
  # DELETE /trips/1.json
  def destroy
    @trip.destroy
    respond_to do |format|
      format.html { redirect_to trips_url, notice: 'Trip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trip_params
      params.require(:trip).permit(:destination, :starting_date, :end_date, :interests, :user_id, :about_myself, :language)
    end
end