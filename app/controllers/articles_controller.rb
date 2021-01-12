class ArticlesController < ApplicationController
	skip_before_action :verify_authenticity_token
	before_action :set_articles,
only: [:show, :update, :destroy]
# GET /todos
def index
@articles = Article.all
end
# GET /todos/:id
def show
@article = Article.find(params[:id])
#json_response(@articles)
end
def new
@article = Article.new
end
# POST /todos
def create
#@recipes = Article.create!(recipe_params)
#json_response(@recipes, :created)
@article = Article.new(recipe_params)
if @article.save
redirect_to @article
else
	render 'new'
end
end

def edit
	@article = Article.find(params[:id])
end	

# PUT /todos/:id
def update 
@article = Article.find(params[:id])

if @article.update(recipe_params)
	redirect_to @article
else
	render 'edit'
end
end
# DELETE /todos/:id
def destroy 
@article = Article.find(params[:id])
@article.destroy

redirect_to articles_path
end

private
def recipe_params
params.require(:article).permit(:name, :yield, :ingredients, :recipe, :image)
end
def set_articles
@articles = Article.find(params[:id])
end

end
