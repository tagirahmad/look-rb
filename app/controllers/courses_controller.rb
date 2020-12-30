class CoursesController < ApplicationController
  def index
    # courses = Course.includes(:authors, :you_learns, :lessons, :categories)
    courses = Course.includes( :you_learns, :lessons)
    # courses = Course.all
    render json: courses, each_serializer: CourseSerializer
  end

  # def related
  #   courses = Course.where(category_id: category_id)
  #   if not courses.blank?
  #     # render json: ['result': author]
  #     render json: courses, each_serializer: CourseSerializer
  #   else
  #     render json: courses.errors, status: :unprocessable_entity
  #   end
  # end

  def create
    course = Course.create(courses_params)
    if course.persisted?
      render json: course.name, status: :created
    else
      render json: course.errors, status: :unprocessable_entity
    end
  end

  def show
    course = Course.find(params[:id])
    if not course.blank?
      # render json: ['result': author]
      render json: course, serializer: CourseSerializer
    else
      render json: course.errors, status: :unprocessable_entity
    end
  end

  private
  def courses_params
    params.require(:course).permit(:name, :description, :author_id, :category_id)
  end
end
