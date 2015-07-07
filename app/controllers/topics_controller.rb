class TopicsController < ApplicationController
	before_action :authenticate_user!
	
	def index
		@topics = Topic.all

	end

	def show
		@topic = Topic.find_by_id(params[:id])
		@discussions = @topic.discussions
	end


	def new
		@topic = Topic.new
	end

	def create
		@topic = Topic.new(topic_params)

		if @topic.save
			flash[:notice] = "Topic was successfully created!"
			redirect_to topic_path(@topic)
		else
			render :new
		end
	end

	def edit
		@topic = Topic.find_by_id(params[:id])
	end

	def update
		@topic = Topic.find_by_id(params[:id])

		if @topic.update_attributes(topic_params)
			flash[:notice] = "Topic was successfully updated!"
			redirect_to topic_path
		else
			render :edit
		end
	end

	def destroy
		@topic = Topic.find_by_id(params[:id])
		@topic.destroy
		flash[:notice] = "Topic was successfully removed!"
		redirect_to topics_path
	end

	private

	def topic_params
		params.require(:topic).permit(:name, :description)
	end


end