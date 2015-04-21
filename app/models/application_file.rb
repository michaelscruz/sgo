# == Schema Information
#
# Table name: application_files
#
#  id                :integer          not null, primary key
#  application_id    :integer
#  file_file_name    :string(255)
#  file_content_type :string(255)
#  file_file_size    :integer
#  file_updated_at   :datetime
#  created_at        :datetime
#  updated_at        :datetime
#

class ApplicationFile < ActiveRecord::Base
	# associations
	belongs_to :application
	has_attached_file :file,
		:storage => :s3,
		:s3_credentials => {
			:bucket => APP_CONFIG["s3_bucket"],
			:access_key_id => APP_CONFIG["s3_access_key_id"],
			:secret_access_key => APP_CONFIG["s3_secret_access_key"]
		},
		# TODO: Lock this down
		# :s3_permissions => :private,
		:path => "income_documents/:id/:filename"	

	# validations
	validates :file, :presence => true
	validates_attachment :file, :content_type => { :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }

end
