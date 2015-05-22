class GenresController < ApplicationController
  before_action :set_genre, only: [:show]

  def show
    @reviews = @genre.reviews.order(points: :desc).limit(10)
  end

  private

  def set_genre
    @genre = Genre.find_by(id: params[:id])
  end

  def genre_params
    params.require(:genre).permit(:name)
  end

end
