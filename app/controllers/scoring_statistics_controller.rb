class ScoringStatisticsController < ApplicationController
  before_action :set_scoring_statistic, only: [:show, :edit, :update, :destroy]

  # GET /scoring_statistics
  # GET /scoring_statistics.json
  def index
    @scoring_statistics = ScoringStatistic.all
  end

  # GET /scoring_statistics/1
  # GET /scoring_statistics/1.json
  def show
  end

  # GET /scoring_statistics/new
  def new
    @scoring_statistic = ScoringStatistic.new
  end

  # GET /scoring_statistics/1/edit
  def edit
  end

  # POST /scoring_statistics
  # POST /scoring_statistics.json
  def create
    @scoring_statistic = ScoringStatistic.new(scoring_statistic_params)

    respond_to do |format|
      if @scoring_statistic.save
        format.html { redirect_to @scoring_statistic, notice: 'Scoring statistic was successfully created.' }
        format.json { render :show, status: :created, location: @scoring_statistic }
      else
        format.html { render :new }
        format.json { render json: @scoring_statistic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scoring_statistics/1
  # PATCH/PUT /scoring_statistics/1.json
  def update
    respond_to do |format|
      if @scoring_statistic.update(scoring_statistic_params)
        format.html { redirect_to @scoring_statistic, notice: 'Scoring statistic was successfully updated.' }
        format.json { render :show, status: :ok, location: @scoring_statistic }
      else
        format.html { render :edit }
        format.json { render json: @scoring_statistic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scoring_statistics/1
  # DELETE /scoring_statistics/1.json
  def destroy
    @scoring_statistic.destroy
    respond_to do |format|
      format.html { redirect_to scoring_statistics_url, notice: 'Scoring statistic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scoring_statistic
      @scoring_statistic = ScoringStatistic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scoring_statistic_params
      params.require(:scoring_statistic).permit(:description, :scoring_category_id, :suggested_points)
    end
end
