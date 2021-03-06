class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
    if !params[:assignment_id].present?
      @assignments = Assignment.all
    else
      @assignments = Assignment.where(id: params[:assignment_id])
    end
    unless current_user.admin?
      ahoy.track "Visited Class Post Page"
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
    @assignment = Assignment.find(@post.assignment_id)
    @group_members = User.where(group_id: User.find(current_user.id).group_id)
    @comments = Comment.where(post_id: @post.id)
    @badge_1 = Badge.where(post_id: @post.id, user_id: current_user.id, name: "good design")
    @badge_2 = Badge.where(post_id: @post.id, user_id: current_user.id, name: "good examples")
    @badge_3 = Badge.where(post_id: @post.id, user_id: current_user.id, name: "well written")
    @badge_4 = Badge.where(post_id: @post.id, user_id: current_user.id, name: "good reflection")
    unless @post.user.id == current_user.id || current_user.admin?
      ahoy.track "Read Post", post_id: @post.id
    end
  end

  # GET /posts/new
  def new
    @post = Post.new
    @assignment = Assignment.find(params[:assignment_id])
  end

  # GET /posts/1/edit
  def edit
    @assignment = Assignment.find(params[:assignment_id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if params[:post][:gold_star].nil?
        ahoy.track "Edited Post", post_id: @post.id
      end
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:user_id, :content, :assignment_id, :bootsy_image_gallery_id, :first_draft, :gold_star)
    end
end
