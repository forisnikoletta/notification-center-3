class ApplicationController < ActionController::Base
	# rails has a set of rules that will communicate with the route, one of them is csrf token 
	# it checks to make sure that a user who's typing into a rails form is actually the real user.
	# verify_authenticity_token will skip this
	skip_before_action :verify_authenticity_token
end
