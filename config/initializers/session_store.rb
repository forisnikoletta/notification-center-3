# here we define what the cookies are going to be structured like

# the key is the name of the session cokkie
Rails.application.config.session_store :cookie_store, key: "_notification_app", domain: "some-name.something.com"