class UserMailer < ActionMailer::Base

	# to access helper methods
	helper :application
  
	  default from: 'notifications@example.com'
	 
	  def welcome_email
	    #@user = user
	    #@url  = 'http://example.com/login'
	    #stackoverflow.com/questions/15910493/syntax-error-when-trying-to-include-usermailer-into-my-controller
	    mail :to => "ud@thetraces.com", :subject => "Post needs review"
	  end
end