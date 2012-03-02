class PostsController < ApplicationController
before_filter :require_login
	def create
		@post = current_user.posts.build(params[:post])
		if @post.save
			flash[:success] = "Post created!"
#			redirected_to root_path
		else
			@feed_items = []			
			render 'pages/home'
		end
	end

	def destroy
	end

	

end

