namespace :monthly_donations do 
	desc "Bill monthly customers whose draft date is today"
	task draft_monthly_donations: :environment do
		Donation.todays_monthly_drafts.each do |donation|
			donation.draft_recurring_donation
			puts "Successfully drafted $#{donation.amount} from #{donation.full_name}."
		end
	end
end