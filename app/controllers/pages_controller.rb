class PagesController < ApplicationController

def home
	@title = "Home"
	if current_user
		@post = Post.new
		@feed_items = current_user.feed.paginate(:page => params[:page])
	end
end

end

