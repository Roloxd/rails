class UsersController < ApplicationController
	skip_before_action :verify_authenticity_token
	before_action :set_recipe,
only: [:show, :update, :destroy]
# GET /todos
def index
@recipes = User.all
json_response(@recipes)
end
# GET /todos/:id
def show
json_response(@recipes)
end
# POST /todos
def create
@recipes = User.create!(recipe_params)
json_response(@recipes, :created)
end

# PUT /todos/:id
def update 
@recipes.update(recipe_params)
head :no_content
end
# DELETE /todos/:id
def destroy 
@recipes.destroy!
head :no_content
end

private
def recipe_params
params.permit(:username, :password)
end
def set_recipe
@recipes = User.find(params[:id])
end
end
