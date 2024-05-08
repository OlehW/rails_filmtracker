class CommentsController < ApplicationController
    before_action :set_film
  
    def new
      @comment = @film.comments.build
    end
  
    def create
      @comment = @film.comments.build(comment_params)
      if @comment.save
        redirect_to @film
      else
        render :new
      end
    end
  
    def edit
      @comment = @film.comments.find(params[:id])
    end
  
    def update
      @comment = @film.comments.find(params[:id])
      if @comment.update(comment_params)
        redirect_to @film
      else
        render :edit
      end
    end
  
    def destroy
      @comment = @film.comments.find(params[:id])
      @comment.destroy
      redirect_to @film
    end
  
    private
  
    def set_film
      @film = Film.find(params[:film_id])
    end
  
    def comment_params
      params.require(:comment).permit(:text)
    end
  end
  