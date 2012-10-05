Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, '06e82d810d6b3804a068',
    'bfe8f54defc23a44734917ac9986ba1a09b05d03', scope: 'user'
end
