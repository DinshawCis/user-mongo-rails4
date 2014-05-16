# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
UserMongo::Application.config.secret_key_base = '2f669dcb9034f585655740263271e1dca9d4c9828630f6e90b5243a55f71947ece1b094ec89d3b4991a66abf6cbd78953e93e263d23ee9976bbb99943306c680'
