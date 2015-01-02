class PointSubmissionsController < ApplicationController
  before_action :set_point_submission, only: [:show, :edit, :update, :destroy]

  # GET /point_submissions
  # GET /point_submissions.json
  def index
    @point_submissions = PointSubmission.all
  end

  # GET /point_submissions/1
  # GET /point_submissions/1.json
  def show
  end

  # GET /point_submissions/new
  def new
    @point_submission = PointSubmission.new
  end

  # GET /point_submissions/1/edit
  def edit
  end

  # POST /point_submissions
  # POST /point_submissions.json
  def create
    @point_submission = PointSubmission.new(point_submission_params)

    respond_to do |format|
      if @point_submission.save
        format.html { redirect_to @point_submission, notice: 'Point submission was successfully created.' }
        format.json { render :show, status: :created, location: @point_submission }
      else
        format.html { render :new }
        format.json { render json: @point_submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /point_submissions/1
  # PATCH/PUT /point_submissions/1.json
  def update
    respond_to do |format|
      if @point_submission.update(point_submission_params)
        format.html { redirect_to @point_submission, notice: 'Point submission was successfully updated.' }
        format.json { render :show, status: :ok, location: @point_submission }
      else
        format.html { render :edit }
        format.json { render json: @point_submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /point_submissions/1
  # DELETE /point_submissions/1.json
  def destroy
    @point_submission.destroy
    respond_to do |format|
      format.html { redirect_to point_submissions_url, notice: 'Point submission was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_point_submission
      @point_submission = PointSubmission.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def point_submission_params
      params.require(:point_submission).permit(:proof_url, :scoring_statistic_id, :points, :player_id, :comment, :status)
    end
end
