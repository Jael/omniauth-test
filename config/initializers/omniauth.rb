Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, '78f28c6347eaa00566c8', '8a45fa00684c96b879884d8b16829aaaebd56ce3'
end

