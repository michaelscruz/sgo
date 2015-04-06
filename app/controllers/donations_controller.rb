class DonationsController < ApplicationController
  # before_action :set_donation, only: [:show, :edit, :update, :destroy]

  # GET /donations
  # GET /donations.json
  def index
  end

  # GET /donations/1
  # GET /donations/1.json
  def show
  end

  # GET /donations/new
  def new
  end

  # GET /donations/1/edit
  def edit
  end

  # POST /donations
  # POST /donations.json
  def create

  end

  # PATCH/PUT /donations/1
  # PATCH/PUT /donations/1.json
  def update

  end

  # DELETE /donations/1
  # DELETE /donations/1.json
  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_donation
      @donation = Donation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def donation_params
      params[:donation]
    end
end
