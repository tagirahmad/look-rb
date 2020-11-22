class CoursesController < ApplicationController
  def index
    courses = Course.includes(:author, :you_learns, :lessons, :category)
    render json: courses, each_serializer: CourseSerializer
  end

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
      render json: course, serializer: ShowCourseSerializer
    else
      render json: course.errors, status: :unprocessable_entity
    end
  end

  private
  def courses_params
    params.require(:course).permit(:name, :description, :author_id, :category_id)
  end
end
