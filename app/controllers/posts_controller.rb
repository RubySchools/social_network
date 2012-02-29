class PostsController < ApplicationController

	def create
		@post = current_user.posts.build(params[:micropost])
		if @post.save
			flash[:success] = "Post created!"
			redirected_to root_path
		else
			@feed_items = []			
			render 'pages/home'
		end
	end

	def destroy
	end

	

end

