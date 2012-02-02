class PostsController < ApplicationController
  load_and_authorize_resource
  
  def index
    #@posts = Post.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
    end
  end

  def show
    #@post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post }
    end
  end

  def new
    #@post = Post.new
    @post.attaches = [Attach.new()]
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post }
    end
  end

  def edit
    #@post = Post.find(params[:id])
    #unauthorized! if cannot? :update, @post
  end

  def create
    #@post = Post.new(params[:post])
    @post.user=current_user
    #@attached_file = AttachedFiles.new(params[:attached_file])
    #@attached_file.parent_id=@post.id
    #@attached_file.parent_type="post"
    #@attached_file.save
    #debugger
    #@post.upfile = params[:post][:upfile]
    respond_to do |format|
      if @post.save
        format.html { redirect_to(@post, :notice => 'Post was successfully created.') }
        format.xml  { render :xml => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    #@post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to(@post, :notice => 'Post was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    #@post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.xml  { head :ok }
    end
  end
end
