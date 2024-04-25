class SeekersController < ApplicationController

  def find
    begin
      # running a Query to relate the DB tables using joins, and filter by the required params
      seekers = Seeker
      .joins(:locations)
      .merge(Location.within_30_miles(seeker_params[:lat], seeker_params[:lon])) # using custom scope with the geocoder gem to calculate distances between 2 geographic points
      .select("seekers.*, ratings.rating AS rating")
      .joins(:ratings, :roles, :availabilities)
      .where('roles.id = ?', seeker_params[:role_id])
      .where('availabilities.date NOT IN (?)', seeker_params[:dates])
      .order('ratings.rating DESC')
      .distinct
      .limit(1000)

      render json: seekers.map { |seeker| FindSerializerHelper.format(seeker) }, status: :ok
    rescue => e
      render json: { message: 'An error occurred', error: e.message }, status: :internal_server_error
    end
  end

  private

  # Strong validation of the params
  def seeker_params
    params.permit(:role_id, :lat, :lon, :dates)
  end
end
