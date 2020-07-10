Rails.application.config.middleware.insert_before 0, Rack::Cors do
	# we are inserting a level of middleware here and we are going to use the cors to do it
	# all of the rules what we place inside here are going to be intercepted by the rails configs

	#if an app tries to communicate with our system that is not authorized to do so and they are coming from a domain which we have not whitelisted, we don't want to give them any acces

	allow do
		origins "http://localhost:3000"
		resource "*", headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: true
		# credentials: true will allow us to pass these headers back and forth and pass the cookie from the front-end to back-end app
	end	


	# it's a placeholder for the production app: we also have the domain that we are going to push this up to
	# CONFIG ME
	allow do
		origins "https://some-name.something.com"
		resource "*", headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: true
		# credentials: true will allow us to pass these headers back and forth and pass the cookie from the front-end to back-end app
	end
end