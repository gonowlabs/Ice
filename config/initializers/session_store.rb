# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_iceproject_session',
  :secret      => '36962921f020f34a6612d3b1d7f0ebdd795d51fdc7fb078855c575a232b55152d017ff85238f2b9aaacd0f0c792ec77ab70edb30318f0a3d6deee1470dd41968'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
