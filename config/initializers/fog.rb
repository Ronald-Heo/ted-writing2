CarrierWave.configure do |config|
  
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     'AKIAI5D5WVGICOROI24A',                        # required
    aws_secret_access_key: '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',                        # required
    region:                'ap-northeast-1'                 # optional, defaults to 'us-east-1'
    
  }
  config.fog_directory  = 'bulletin-article'                          # required
  
end