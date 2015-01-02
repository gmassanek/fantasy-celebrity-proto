class ScoringCategoriesController < ApplicationController
  before_action :set_scoring_category, only: [:show, :edit, :update, :destroy]

  # GET /scoring_categories
  # GET /scoring_categories.json
  def index
    @scoring_categories = ScoringCategory.all
  end

  # GET /scoring_categories/1
  # GET /scoring_categories/1.json
  def show
  end

  # GET /scoring_categories/new
  def new
    @scoring_category = ScoringCategory.new
  end

  # GET /scoring_categories/1/edit
  def edit
  end

  # POST /scoring_categories
  # POST /scoring_categories.json
  def create
    @scoring_category = ScoringCategory.new(scoring_category_params)

    respond_to do |format|
      if @scoring_category.save
        format.html { redirect_to @scoring_category, notice: 'Scoring category was successfully created.' }
        format.json { render :show, status: :created, location: @scoring_category }
      else
        format.html { render :new }
        format.json { render json: @scoring_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scoring_categories/1
  # PATCH/PUT /scoring_categories/1.json
  def update
    respond_to do |format|
      if @scoring_category.update(scoring_category_params)
        format.html { redirect_to @scoring_category, notice: 'Scoring category was successfully updated.' }
        format.json { render :show, status: :ok, location: @scoring_category }
      else
        format.html { render :edit }
        format.json { render json: @scoring_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scoring_categories/1
  # DELETE /scoring_categories/1.json
  def destroy
    @scoring_category.destroy
    respond_to do |format|
      format.html { redirect_to scoring_categories_url, notice: 'Scoring category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scoring_category
      @scoring_category = ScoringCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scoring_category_params
      params.require(:scoring_category).permit(:name)
    end
end
