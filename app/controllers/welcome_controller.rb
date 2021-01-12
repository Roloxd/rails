class WelcomeController < ApplicationController
  def index

  end
  def show
  	   @articles = Article.all.with_attached_image

    render json: @articles.map { |article|
      article.as_json.merge({ image: url_for(article.image) })
    }
  end


end
