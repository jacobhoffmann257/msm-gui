class MoviesController < ApplicationController
  def index
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)

    render({ :template => "movie_templates/show" })
  end
  def create
    movie = Movie.new
    movie.title = params.fetch("query_title")
    movie.year = params.fetch("query_year")
    movie.duration = params.fetch("query_duration")
    movie.description = params.fetch("query_description")
    movie.image = params.fetch("query_image")
    movie.director_id = params.fetch("query_director_id")
    if movie.valid?
      movie.save
      redirect_to("/movies", {:notice=> "Movie added successfully."})
    else
    redirect_to("/directors", {:notice=>"Movie failed to add successfully."})
    end
  end
  def update
  id = params.fetch("path_id")
  movie = Movie.where({:id => id}).at(0)

  movie.title = params.fetch("query_title")
  movie.year = params.fetch("query_year")
  movie.duration = params.fetch("query_duration")
  movie.description = params.fetch("query_description")
  movie.image = params.fetch("query_image")
  movie.director_id = params.fetch("query_director_id")
  if movie.valid?
    movie.save
    redirect_to("/movies/#{movie.id}", {:notice => "Movie successfully updated."})
  else
    redirect_to("/movies/#{:notice => "Movies failed to update successfully."}")
  end
end
def delete
  the_id = params.fetch("path_id")
  @movie = Movie.where({:id => the_id}).at(0)
  @movie.destroy
  redirect_to("/movies",{:notice => "Movie has been deleted"})
end
end
