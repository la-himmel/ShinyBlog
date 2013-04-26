class TagsController < ApplicationController
  # GET /tags
  # GET /tags.json
  def index
    @tags = Tag.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tags }
    end
  end

  # GET /tags/1
  # GET /tags/1.json
  def show
    @tag = Tag.find(params[:id])
    @entries = Entry.find_by_tag(@tag, :order => 'created_at DESC')

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tag }
    end
  end
end
