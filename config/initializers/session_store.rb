# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_flo68_session',
  :secret      => '60a217fb69819dac4af2341414864303b317b59d0c056bbba77b2777518e45cdefff8cc5ac8b2292ee07d00116d6d66219cbd738360c5c111c880b47c1039c6f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
