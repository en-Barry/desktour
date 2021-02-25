class CategoriesController < ApplicationController
  skip_before_action :require_login, only: %i[index show]
  before_action :set_category, only: %i[show]

  def index 
    @posts = Post.all.includes(:user).order(created_at: :desc)
  end

  def show
    @posts = @category.post_categories.includes(:post).order(created_at: :desc)
  end

  private

  def to_params
    name
  end

  def set_category
    @category = Category.find_by(name: params[:name])
  end
end
