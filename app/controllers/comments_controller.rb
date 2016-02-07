class CommentsController < ApplicationController

  before_action :get_article, only: [:create]

  def create
    @comment = Comment.new(comment_params)
    respond_to do |format|
      if @comment.save
        @article.comments << @comment
        format.html { redirect_to @article, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :body, :article_id)
  end

  def get_article
    @article = Article.find_by_id(params[:article_id])
  end

end
