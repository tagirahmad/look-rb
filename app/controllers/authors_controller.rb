class AuthorsController < ApplicationController
  def index
    authors = Author.includes(author::courses)
    render json: authors
  end

  def create
    author = Author.create(authors_params)
    if author.persisted?
      render json: ['success': true], status: :created
    else
      render json: author.errors, status: :unprocessable_entity
    end
  end

  def show
    author = Author.find(params[:id])
    if not author.blank?
      # render json: ['result': author]
      render json: author
    else
      render json: author.errors, status: :unprocessable_entity
    end
  end

    private
  def authors_params
    params.permit(:first_name, :last_name, :about)
  end

end
