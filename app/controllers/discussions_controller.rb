class DiscussionsController < ApplicationController
	before_action :authenticate_user!

	def index
		@discussions = Discussion.all
	end

	def show
		@discussion = Discussion.find_by_id(params[:id])
		@posts = @discussion.posts
		@id = @discussion.topic_id

	end

	def new
		@discussion = Discussion.new
	end

	def create
		@discussion = Discussion.new(discussion_params)	

	if @discussion.save
			flash[:notice] = "Discussion was successfully created!"
			redirect_to discussion_path(@discussion)
		else
			render :new
		end

	end

	def edit
		@discussion = Discussion.find_by_id(params[:id])
	end

	def update
		@discussion = Discussion.find_by_id(params[:id])

		if @discussion.update_attributes(discussion_params)
			flash[:notice] = "Discussion was successfully updated!"
			redirect_to discussion_path(@discussion)
		else
			render :edit
		end
	end

	def destroy
    @discussion = Discussion.find_by_id(params[:id])
    @id = @discussion.topic_id
    @discussion.destroy
    flash[:notice] = "Discussion was successfully removed!"
    redirect_to topic_path(@id)
  end

  private

  def discussion_params
  	params.require(:discussion).permit(:name, :description, :topic_id)
  end

end
