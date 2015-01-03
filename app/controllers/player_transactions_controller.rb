class PlayerTransactionsController < ApplicationController
  before_action :set_player_transaction, only: [:show, :edit, :update, :destroy]

  # GET /player_transactions
  # GET /player_transactions.json
  def index
    @player_transactions = PlayerTransaction.all
  end

  # GET /player_transactions/1
  # GET /player_transactions/1.json
  def show
  end

  # GET /player_transactions/new
  def new
    @player_transaction = PlayerTransaction.new
  end

  # GET /player_transactions/1/edit
  def edit
  end

  # POST /player_transactions
  # POST /player_transactions.json
  def create
    @player_transaction = PlayerTransaction.new(player_transaction_params)

    respond_to do |format|
      if @player_transaction.save
        format.html { redirect_to @player_transaction, notice: 'Player transaction was successfully created.' }
        format.json { render :show, status: :created, location: @player_transaction }
      else
        format.html { render :new }
        format.json { render json: @player_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /player_transactions/1
  # PATCH/PUT /player_transactions/1.json
  def update
    respond_to do |format|
      if @player_transaction.update(player_transaction_params)
        format.html { redirect_to @player_transaction, notice: 'Player transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @player_transaction }
      else
        format.html { render :edit }
        format.json { render json: @player_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /player_transactions/1
  # DELETE /player_transactions/1.json
  def destroy
    @player_transaction.destroy
    respond_to do |format|
      format.html { redirect_to player_transactions_url, notice: 'Player transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player_transaction
      @player_transaction = PlayerTransaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_transaction_params
      params.require(:player_transaction).permit(:player_id, :action, :team_id, :position_id)
    end
end
