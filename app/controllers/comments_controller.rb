class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: %i[ new create ]

  def new
    if params[:parent_id]
      @comment = @post.comments.build(parent_id: params[:parent_id])
      puts "*************#{params[:parent_id]}**********************"
      render 'replies/new'
    else
      @comment = @post.comments.build
    end
  end

  def create
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to posts_path, notice: "Comment was successfully created." }
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_post
      @post = Post.find(params[:post_id]) 
    end
    
    def comment_params
      params.require(:comment).permit(:content, :post_id, :parent_id)
    end
end