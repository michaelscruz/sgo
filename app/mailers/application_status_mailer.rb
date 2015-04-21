class ApplicationStatusMailer < ActionMailer::Base
  default from: "sgo@i4qed.org"

  def status_change(status, application)
  	@status = status
  	@application = application
  	mail :to => @application.email, :subject => "I4QED SGO | Application Status"
  end
end