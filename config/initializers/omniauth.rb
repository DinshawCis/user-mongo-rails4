Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, '880a530bb5296c72ca70', '9a16d8bb7c749e7cc8532fb6405dd9dc1f8558b'
end