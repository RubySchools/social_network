#coding: UTF-8
class PostsController < ApplicationController
before_filter :authorized_user, :only => :destroy
before_filter :require_login
  #include MuckComments::Models::MuckComment

	def create
		@post = current_user.posts.build(params[:post])
		if @post.save
			flash[:success] = "Новость создана!"
			redirect_to root_path
	
		else
			@feed_items = []			
			render 'pages/home'
		end
	end

  def show
    @post =current_user.posts.find_by_id(params[:id])
		respond_to do |format|  
    	format.html # show.html.erb
    	format.json { render json: @post }
		end
  end


	def destroy
		@post.destroy
		redirect_to root_path
	end

# GET /users/1/posts
  def userposts
    @title = "Новости добавленные пользователем"
    @user = User.find(params[:id])
    @feed_items = @user.feed.paginate(:page => params[:page])
  end

# GET /users/1/posts/1
 def userpost
    @title = "Новости"
    @user = User.find(params[:id])
    @post = @user.posts.find_by_id(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
 end

private
	def authorized_user
	@post =current_user.posts.find_by_id(params[:id])
	redirect_to root_path if @post.nil?
	end
	
end
