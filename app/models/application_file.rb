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
		:s3_permissions => :private,
		:path => "income_documents/:id/:filename"	

	validates_attachment :file, :content_type => { :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }

end
