class EvaluationsController < ApplicationController
  before_action :set_evaluation, only: [:show, :edit, :update, :destroy]

  # GET /evaluations
  # GET /evaluations.json
  def index
    @tournament = Tournament.find(params[:tournament_id])
    if @tournament.closed?
      @evaluations = Evaluation.where(tournament_id: params[:tournament_id])
      @posts_eval = Array.new
      @evaluations.each do |eval|
        @posts_eval = @posts_eval << eval.post
      end
      @posts_eval = @posts_eval.uniq
      @posts_hash = Hash.new
      @posts_eval.each do |post|
        @posts_hash[post.id] = Evaluation.where(tournament_id: params[:tournament_id], post_id: post.id).sum(:row_order)
      end
      @posts = Array.new
      @posts_hash.sort_by(&:last).to_h.keys.each do |post|
        @posts << Post.find(post)
      end
    else
      @evaluations = Evaluation.where(tournament_id: params[:tournament_id], user_id: current_user.id).rank(:row_order)
    end
  end

  def update_row_order
    @evaluation = Evaluation.find(evaluation_params[:evaluation_id])
    @evaluation.row_order_position = evaluation_params[:row_order_position]
    @evaluation.save

    render nothing: true # this is a POST action, updates sent via AJAX, no view rendered
  end

  # GET /evaluations/1
  # GET /evaluations/1.json
  def show
    @evaluation = Evaluation.find(params[:id])
    @post = @evaluation.post
  end

  # GET /evaluations/new
  def new
    @evaluation = Evaluation.new
  end

  # GET /evaluations/1/edit
  def edit
  end

  # POST /evaluations
  # POST /evaluations.json
  def create
    @evaluation = Evaluation.new(evaluation_params)

    respond_to do |format|
      if @evaluation.save
        format.html { redirect_to @evaluation, notice: 'Evaluation was successfully created.' }
        format.json { render :show, status: :created, location: @evaluation }
      else
        format.html { render :new }
        format.json { render json: @evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /evaluations/1
  # PATCH/PUT /evaluations/1.json
  def update
    respond_to do |format|
      if @evaluation.update(evaluation_params)
        format.html { redirect_to @evaluation, notice: 'Evaluation was successfully updated.' }
        format.json { render :show, status: :ok, location: @evaluation }
      else
        format.html { render :edit }
        format.json { render json: @evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /evaluations/1
  # DELETE /evaluations/1.json
  def destroy
    @evaluation.destroy
    respond_to do |format|
      format.html { redirect_to evaluations_url, notice: 'Evaluation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evaluation
      @evaluation = Evaluation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def evaluation_params
      params.require(:evaluation).permit(:evaluation_id, :row_order_position, :post_id, :user_id, :tournament_id)
    end
end
