class PagesController < ApplicationController

def home
	@title = "Home"
	@post = Post.new
	@feed_items = current_user.feed.paginate(:page => params[:page])
end

end
