class ArtistsController < ApplicationController

    def show
        @artist = artist_search
    end

    def new
        @artist = Artist.new
    end

    def create
        @artist = Artist.new(artist_params(:name, :bio))
        @artist.save
        redirect_to artist_path(@artist)
    end

    def edit
        @artist = artist_search
    end

    def update
        @artist = artist_search
        @artist.update(artist_params(:name, :bio))
        redirect_to artist_path(@artist)
    end

    private

    def artist_search
        Artist.find(params[:id])
    end

    def artist_params(*args)
        params.require(:artist).permit(*args)
    end
end
