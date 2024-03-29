class EntriesController < ApplicationController
  skip_before_filter :authorize, :only => [:index, :show]
  # GET /entries
  # GET /entries.json
  def index
    @entries = Entry.find(:all, :order => 'created_at DESC')
    @show_comments = TRUE

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @entries }
    end
  end

  def entry_list
    @entries = Entry.find(:all, :order => 'created_at DESC')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @entries }
    end
  end

  # GET /entries/1
  # GET /entries/1.json
  def show
    @entry = Entry.find(params[:id])
    @comment = Comment.new(:entry => @entry )
    @show_comments = FALSE


    @tags = @entry.tag.split(/,/)
    @tags.each do |tag| 
      @t = Tag.find_or_create_by_body(tag.strip)
      @t.save
 
      @tagging = Tagging.find_or_create_by_entry_id_and_tag_id(:entry_id => @entry.id, :tag_id => @t.id)
      @tagging.save
    end  
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @entry }
    end
  end

  def show_by_tag
    @entries = Entry.find_by_tag(params[:tag], :order => 'created_at DESC')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @entries }
    end
  end


  # GET /entries/new
  # GET /entries/new.json
  def new
    @entry = Entry.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @entry }
    end
  end

  # GET /entries/1/edit
  def edit
    @entry = Entry.find(params[:id])
  end

  # POST /entries
  # POST /entries.json
  def create
    @entry = Entry.new(params[:entry])

    respond_to do |format|
      if @entry.save
        format.html { redirect_to @entry, notice: 'Entry was successfully created.' }
        format.json { render json: @entry, status: :created, location: @entry }
      else
        format.html { render action: "new" }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /entries/1
  # PUT /entries/1.json
  def update
    @entry = Entry.find(params[:id])

    respond_to do |format|
      if @entry.update_attributes(params[:entry])
        format.html { redirect_to @entry, notice: 'Entry was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1
  # DELETE /entries/1.json
  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy

    respond_to do |format|
      format.html { redirect_to entries_url }
      format.json { head :no_content }
    end
  end
end
