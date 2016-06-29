class ForumPostRepliesController < ApplicationController
  before_action :set_forum_post_reply, only: [:show, :edit, :update, :destroy]

  # GET /forum_post_replies
  # GET /forum_post_replies.json
  def index
    @forum_post_replies = ForumPostReply.all
  end

  # GET /forum_post_replies/1
  # GET /forum_post_replies/1.json
  def show
  end

  # GET /forum_post_replies/new
  def new
    @forum_post_reply = ForumPostReply.new
  end

  # GET /forum_post_replies/1/edit
  def edit
  end

  # POST /forum_post_replies
  # POST /forum_post_replies.json
  def create
    @forum_post_reply = ForumPostReply.new(forum_post_reply_params)

    respond_to do |format|
      if @forum_post_reply.save
        format.html { redirect_to :back, notice: 'Forum post reply was successfully created.' }
        format.json { render :show, status: :created, location: @forum_post_reply }
      else
        format.html { render :new }
        format.json { render json: @forum_post_reply.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /forum_post_replies/1
  # PATCH/PUT /forum_post_replies/1.json
  def update
    respond_to do |format|
      if @forum_post_reply.update(forum_post_reply_params)
        format.html { redirect_to :back , notice: 'Forum post reply was successfully updated.' }
        format.json { render :show, status: :ok, location: @forum_post_reply }
      else
        format.html { render :edit }
        format.json { render json: @forum_post_reply.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forum_post_replies/1
  # DELETE /forum_post_replies/1.json
  def destroy
    @forum_post_reply.destroy
    respond_to do |format|
      format.html { redirect_to forum_post_replies_url, notice: 'Forum post reply was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_forum_post_reply
      @forum_post_reply = ForumPostReply.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def forum_post_reply_params
      params.require(:forum_post_reply).permit(:content, :user_id, :forum_post_id)
    end
end
