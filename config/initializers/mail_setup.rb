Rails.application.config.action_mailer.perform_deliveries = !(Rails.env.development?)
Rails.application.config.action_mailer.delivery_method = :smtp
Rails.application.config.action_mailer.smtp_settings = {
	:address              => 'email-smtp.us-east-1.amazonaws.com',
	:port                 => 587,
	:authentication       => :plain,
	:user_name            => APP_CONFIG["smtp"]["username"],
	:password             => APP_CONFIG["smtp"]["password"],
	:enable_starttls_auto => true
}