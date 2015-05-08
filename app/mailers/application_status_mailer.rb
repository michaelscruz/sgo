class ApplicationStatusMailer < ActionMailer::Base
  default from: "sgo@i4qed.org"

  def parent_application_confirmation(application)
  	@application = application
  	mail :to => application.email, :subject => "IQE SGO [Application Confirmation]"
  end

  def school_application_notification(application)
  	@application = application
    school = application.school
  	mail :to => school.email, :subject => "IQE SGO [Application Notification]"
  end

  def school_sgo_notification(application)
  	@application = application
  	mail :to => application.email, :subject => "IQE SGO [Application Approval]"
  end

  def sgo_school_notification(application)
  	@application = application
  	mail :to => application.email, :subject => "IQE SGO [Application Review]"
  end
end