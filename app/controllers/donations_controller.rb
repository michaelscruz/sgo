class DonationsController < ApplicationController
  before_action :authenticate_user!, :except => [:new, :create]
  before_action :set_schools, only: [:new, :create]
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
    @donation = Donation.new
    @donation.build_donor
    @donation.fund_designations.build
  end

  # GET /donations/1/edit
  def edit
  end

  # POST /donations
  # POST /donations.json
  def create
    @donation = Donation.new(donation_params)
    @donor = Donor.new(donor_params) ## !! Will have to look up the donor if current_user is returning donor
    if @donor.email.blank? || @donor.password.blank?
      @donor.one_time = true
    end

    # Try to save the donor first if they have entered
  
    if @donor.save
      if @donation.save
        redirect_to root_url, notice: "Thank you for your donation! It has been successfully submitted."
      else
        render 'new'
      end
    else
      render 'new'
    end
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
      params.require(:donation).permit(:id, :amount, :matched, fund_designations_attributes: [:id, :percentage, :school_id, :donation_id, :_destroy])
    end

    def donor_params
      params.require(:donor).permit(:id, :donor_type, :email, :password, :password_confirmation, :first_name, :last_name,
        :middle_initial, :ssn, :address, :apt, :city, :state, :zip)
    end

    def set_schools
      @schools = School.all.map { |s| [s.name, s.id] }
    end
end
