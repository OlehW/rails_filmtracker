class FilmsController < ApplicationController
  def index
    @films = Film.all
  end

  def new
    @film = Film.new
  end

  def show
    @omdb = OmdbService.new
    @omdb_film = @omdb.find_by_title(@film.name)
  end

  def create
    @film = Film.new(film_params)
    if @film.save
      redirect_to @film
    else
      render :new
    end
  end

  def show
    @film = Film.find(params[:id])
  end

  def edit
    @film = Film.find(params[:id])
  end

  def update
    @film = Film.find(params[:id])
    if @film.update(film_params)
      redirect_to @film
    else
      render :edit
    end
  end

  def destroy
    @film = Film.find(params[:id])
    @film.destroy
    redirect_to films_path
  end

  def omdb_search
    if params[:search_query].present?
      @omdb = OmdbService.new
      res = @omdb.search(params[:search_query])
      @search_results = res['Search']
      @search_results.each do |film|
        film_data = @omdb.find_by_id(film['imdbID'])
        film['Director'] = film_data['Director']
        film['Duration'] = film_data['Runtime']
        film['Genre'] = film_data['Genre']
        film['Description'] = film_data['Plot']
      end
    end
  end
  

  private

  def film_params
    params.require(:film).permit(:title, :director, :duration, :year, :genre, :description)
  end
end