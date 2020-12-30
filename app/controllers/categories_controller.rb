# require 'pry'

class CategoriesController < ApplicationController
  def index
    # categories = Category.includes(:courses)
    categories = Category.all
    # render json: categories, include: %w[course.lessons course.you_learns course.author]
    render json: categories
  end

  def create
    category = Category.create(you_learns_params)
    if category.persisted?
      render json: ['success': true], status: :created
    else
      render json: category.errors, status: :unprocessable_entity
    end
  end

  def show_related_courses
    name = params[:name]
    # courses = Category.find_by!(name: category_params[:name]).courses
    courses = Category.find_by!(name: name).courses
    # binding.pry
    if not courses.blank?
      render json: courses
    else
      render json: courses.errors, status: :unprocessable_entity
    end
  end

  def show
    category = Category.find(params[:id])
    if not category.blank?
      # render json: category, include: %w[course.lessons course.you_learns]
      # render json: category, include: '**'
      render json: category
    else
      render json: category.errors, status: :unprocessable_entity
    end
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end
