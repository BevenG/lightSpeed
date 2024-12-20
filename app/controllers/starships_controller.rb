class StarshipsController < ApplicationController
  def index
    @starships = Starship.all
    if params[:query].present?
      sql_subquery = "name ILIKE :query OR address ILIKE :query"
      @starships = @starships.where(sql_subquery, query: "%#{params[:query]}%")
    end
    @markers = @starships.geocoded.map do |starship|
      {
        lat: starship.latitude,
        lng: starship.longitude
      }
    end
  end

  def show
    @starship = Starship.find(params[:id])
  end

  def new
    @starship = Starship.new # Needed to instantiate the form_with
  end

  def create
    @starship = Starship.new(starship_params)
    @starship.user = current_user
    @starship.save
    # No need for app/views/starships/create.html.erb
    redirect_to starship_path(@starship)
  end

  def destroy
    @starship = Starship.find(params[:id])
    @starship.destroy

    # No need for app/views/starships/destroy.html.erb
    redirect_to starships_path, status: :see_other
  end

  private

  def starship_params
    params.require(:starship).permit(:price, :mass, :top_speed, :photo)
  end
end
