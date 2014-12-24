class LeagueRosterSlotsController < ApplicationController
  before_action :set_league_roster_slot, only: [:show, :edit, :update, :destroy]

  # GET /league_roster_slots
  # GET /league_roster_slots.json
  def index
    @league_roster_slots = LeagueRosterSlot.all
  end

  # GET /league_roster_slots/1
  # GET /league_roster_slots/1.json
  def show
  end

  # GET /league_roster_slots/new
  def new
    @league_roster_slot = LeagueRosterSlot.new
  end

  # GET /league_roster_slots/1/edit
  def edit
  end

  # POST /league_roster_slots
  # POST /league_roster_slots.json
  def create
    @league_roster_slot = LeagueRosterSlot.new(league_roster_slot_params)

    respond_to do |format|
      if @league_roster_slot.save
        format.html { redirect_to @league_roster_slot, notice: 'League roster slot was successfully created.' }
        format.json { render :show, status: :created, location: @league_roster_slot }
      else
        format.html { render :new }
        format.json { render json: @league_roster_slot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /league_roster_slots/1
  # PATCH/PUT /league_roster_slots/1.json
  def update
    respond_to do |format|
      if @league_roster_slot.update(league_roster_slot_params)
        format.html { redirect_to @league_roster_slot, notice: 'League roster slot was successfully updated.' }
        format.json { render :show, status: :ok, location: @league_roster_slot }
      else
        format.html { render :edit }
        format.json { render json: @league_roster_slot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /league_roster_slots/1
  # DELETE /league_roster_slots/1.json
  def destroy
    @league_roster_slot.destroy
    respond_to do |format|
      format.html { redirect_to league_roster_slots_url, notice: 'League roster slot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_league_roster_slot
      @league_roster_slot = LeagueRosterSlot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def league_roster_slot_params
      params.require(:league_roster_slot).permit(:position_id, :league_id, :count)
    end
end
