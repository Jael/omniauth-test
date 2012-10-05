Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, '7182ca3203492da3859d',
          'c824773279b2c46f779c6e393c02935e19389ba9'
end
