class LessonsController < ApplicationController
  def index
    lessons = Lesson.includes(:course)
    # lessons = Lesson.all
    render json: lessons
  end

  def create
    lesson = Lesson.create(lessons_params)
    if lesson.persisted?
      render json: ['success': true], status: :created
    else
      render json: lesson.errors, status: :unprocessable_entity
    end
  end

  def show
    lesson = Lesson.find(params[:id])
    if not lesson.blank?
      render json: lesson
    else
      render json: lesson.errors, status: :unprocessable_entity
    end
  end

  private
  def lessons_params
    params.require(:lesson).permit(:title, :lesson_number, :preview_img, :description, :course_id)
  end
end
