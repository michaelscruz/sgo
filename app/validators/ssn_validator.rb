class SsnValidator < ActiveModel::Validator
	def validate record
		unless record.ssn.blank?
			record.ssn = record.ssn.tr('-', '')
			if !((record.ssn.to_i.to_s == record.ssn) && (record.ssn.length == 9))
			  record.errors[:ssn] << "Invalid SSN. Must be 9 digits. May be separated by hyphens."
			end
		end
	end
end