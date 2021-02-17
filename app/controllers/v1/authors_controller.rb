module V1
  class AuthorsController < ApplicationController
    before_action :set_author, only: [:show, :destroy, :update]
    serialization_scope nil

    def index
      authors = Author.preload(:books)#.paginate(page: params[:page])
      render json: authors, adapter: :json , meta: {total: authors.count}, :meta_key => 'extra_info'
    end

    def show
      render json: @author, adapter: :json, :scope => total_author, :scope_name => :author_count
    end

    def create
      author = Author.new(author_params)
      if author.save
        render json: author, adapter: :json, status: 201
      else
        render json: { error: author.errors }, status: 422
      end
    end

    def update
      if @author.update(author_params)
        render json: @author, adapter: :json, status: 200
      else
        render json: { error: @author.errors }, status: 422
      end
    end

    def destroy
      @author.destroy
      head 204
    end

    private

    def set_author
      @author = Author.find(params[:id])
    end

    def author_params
      params.require(:author).permit(:first_name, :last_name)
    end

    def total_author
      Author.count
    end
  end
end