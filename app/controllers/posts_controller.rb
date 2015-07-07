class PostsController < ApplicationController
  before_action :authenticate_user!

	def index
		@posts = Post.all
	end

	def show
    @post = Post.find_by_id(params[:id])
  end

  def new
    @post = Post.new
    @discussion_id = params[:discussion_id]

  end

  def create
    # initialize new post object with form values
    @post = Post.new(post_params)

    
    if @post.save
      flash[:notice] = "post was successfully created!"
      redirect_to discussion_path(post_params[:discussion_id])
    else
      render :new
    end

  end

  def edit
    @post = Post.find_by_id(params[:id])
  end

  def update
    @post = Post.find_by_id(params[:id])

    if @post.update_attributes(post_params)
      flash[:notice] = "Post was successfully updated!"
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find_by_id(params[:id])
    @id = @post.discussion_id
    @post.destroy
    flash[:notice] = "post was successfully removed!"
    redirect_to discussion_path(@id)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :user_id, :discussion_id)
  end






end