class Api::V1::IdeasController < ApplicationController
  def index
    @ideas = Idea.order('created_at DESC')
    render json: @ideas, status: :ok
  end

  def create
    @idea = Idea.create(idea_params)
    render json: @idea, status: :ok
  end

  def update
    @idea = Idea.find(params[:id])
    @idea.update_attributes(idea_params)
    render json: @idea, status: :ok
  end

  def destroy
    @idea = Idea.find(params[:id])
    if @idea.destroy
      head :no_content, status: :ok
    else
      render json: @idea.errors, status: :unprocessable_entity
    end
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :body)
  end
end


