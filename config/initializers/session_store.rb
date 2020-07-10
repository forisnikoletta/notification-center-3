# here we define what the cookies are going to be structured like

if Rails.env == "production"
	# the key is the name of the session cokkie#
	Rails.application.config.session_store :cookie_store, key: "_notification_app", domain: "some-name.something.com"
else 
	Rails.application.config.session_store :cookie_store, key: "_notification_app"
end