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
    @donation.build_non_user_donor
    @donation.fund_designations.build
  end

  # GET /donations/1/edit
  def edit
  end

  # POST /donations
  # POST /donations.json
  def create
    @donation = Donation.new(donation_params)
    begin
      @donation.total_for_general_fund
      @non_user_donor = @donation.non_user_donor
      @donor = @donation.donor
      @donor.first_name = @non_user_donor.first_name
      @donor.last_name = @non_user_donor.last_name
      @non_user_donor.email = @donor.email

      if !@donor.password.blank?
        if @donor.save
          create_donation
        else
          render 'new'
        end
      else
        @donation.donor = nil
        create_donation
      end
    rescue RuntimeError
      @donation.errors.add :base, "Fund Designations percentages must add up to 100 or less."
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
      params.require(:donation).permit(:id, :amount, :matched, :stripe_card_token, :matching_organization, :match_amount,
        donor_attributes: [:donor_type, :email, :password, :password_confirmation, :terms_of_use],
        fund_designations_attributes: [:id, :percentage, :school_id, :donation_id, :_destroy],
        non_user_donor_attributes: [:first_name, :last_name, :middle_initial, :ssn, :address, :apt, :city, 
          :state, :zip])
    end

    def set_schools
      @schools = School.all.map { |s| [s.name, s.id] }
    end

    def create_donation
      if @non_user_donor.save
        if @donation.save_with_payment
          redirect_to root_url, notice: "Thank you for your donation! It has been successfully submitted."
        else
          puts @donation.matching_organization
          render 'new'
        end
      else
        render 'new'
      end
    end
end
