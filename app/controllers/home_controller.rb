class HomeController < ApplicationController
  # GET /
  def index
    @articles = Article.published
  end
end
