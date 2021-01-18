class FavoritesController < ApplicationController
  def index
    @favorite_topics =current_user.favorite_topics
  end
end
