class UploadsController < ApplicationController

skip_before_filter :require_login, :only => [:index, :show]

def index

	if User.exists?(params[:id])
			user = User.find(params[:id])
		@files = user.uploads + user.saved_uploads
	else
			redirect_to(:my_downloads, :notice => "Files not found")
	end
end

#Shows only one chosen file? with description.
def show
    @file = Upload.find(params[:id])
end

def new
    @file = Upload.new
  end

  # GET /files/1/edit
  def edit
    @file = Upload.find(params[:id])
  end

  # POST /files
  # POST /files.json
  def create
	@file = Upload.new(params[:upload])
	@file.user = current_user
    respond_to do |format|
      if @file.save
        format.html { redirect_to(:uploads, :notice => 'file was successfully created.') }
        format.json { render json: @file, status: :created, location: @file }
      else
        format.html { render action: "new" }
        format.json { render json: @file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /files/1
  # PUT /files/1.json
  def update
    @file = Upload.find(params[:id])

    respond_to do |format|
      if @file.update_attributes(params[:file])
        format.html { redirect_to @file, notice: 'file was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /files/1
  # DELETE /files/1.json
  def destroy
    @file = Upload.find(params[:id])
    @file.destroy
  end

def favourite
	@files = current_user.saved_uploads + current_user.uploads
end

def add_to_favorite
	favourite_upload = UsersUpload.new(:user => current_user,:upload => Upload.find(params[:id]))
			if favourite_upload.save
				respond_to do |format|
					  		format.html { redirect_to uploads_url }
				end	
			end
	end
	
	def delete_from_favorites			
			@favourite_upload = UsersUpload.where(:upload_id => params[:id],:user_id => current_user.id)	   	
			@favourite_upload.first.destroy
				respond_to do |format|
					  		format.html { redirect_to my_downloads_url }
				end
	end






end
