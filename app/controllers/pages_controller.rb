#coding: UTF-8
class PagesController < ApplicationController

def home
	@title = "Главная"
	if current_user
		@post = Post.new
    @user = current_user
    @feed_items = @user.posts.paginate(:page => params[:page])
	end
end

end

