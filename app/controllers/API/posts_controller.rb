module API
  class PostsController < ApplicationController
    skip_before_filter :verify_authenticity_token

    def index
      render json: Post.order(id: :desc), status: :ok
    end

    def create
      post = Post.new(post_params)
      if post.save
        render json: post, status: 201
      else
        render json: post.errors, status: 422
      end
    end

    def destroy
      Post.find(params[:id]).destroy
      head 204
    end

    def show
      render json: Post.find(params[:id]), status: :ok
    end

    private
    def post_params
      params.require(:post).permit(:title, :body)
    end


  end
end