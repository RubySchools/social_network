class UploadsController < ApplicationController

skip_before_filter :require_login, :only => [:index, :show]

#Page where all Uploads are available
def index
@files = Upload.all
@user = User.find(1)
   @title = "Downloads"
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @files }
    end
end

#Shows only one chosen file? with description.
def show
    @file = Upload.find(params[:id])
	    respond_to do |format|
	      format.html # show.html.erb
	      format.json { render json: @file }
    end
end

def new
    @file = Upload.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @file }
    end
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

    respond_to do |format|
      format.html { redirect_to uploads_url }
      format.json { head :ok }
    end
  end

	def user_uploads
			@files = current_user.uploads.all	
	end






end
