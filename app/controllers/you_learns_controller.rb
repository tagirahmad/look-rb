class YouLearnsController < ApplicationController
    def index
      you_learns = YouLearn.includes(:course)
      # you_learns = YouLearn.all
      render json: you_learns
    end

    def create
      you_learn = YouLearn.create(you_learns_params)
      if you_learn.persisted?
        render json: ['success': true], status: :created
      else
        render json: you_learn.errors, status: :unprocessable_entity
      end
    end

    def show
      you_learn = YouLearn.find(params[:id])
      if not you_learn.blank?
        # render json: ['result': author]
        render json: you_learn
      else
        render json: you_learn.errors, status: :unprocessable_entity
      end
    end

    private
    def you_learns_params
      params.require(:you_learn).permit(:title, :image, :course_id)
    end
end

