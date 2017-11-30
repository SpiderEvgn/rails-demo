# require 'carrierwave'
# require 'carrierwave/validations/active_model'

CarrierWave.configure do |config|

  config.storage = ENV["IS_OSS_CONFIG"]=='true' ? :aliyun : :file
  config.aliyun_access_id  = ENV["ALIYUN_OSS_ACCESS_ID"]
  config.aliyun_access_key = ENV["ALIYUN_OSS_ACCESS_KEY"]
  config.aliyun_bucket     = ENV["ALIYUN_OSS_BUCKET"]
  # config.aliyun_internal   = Setting.upload_aliyun_internal.to_s == 'false' ? false : true
  config.aliyun_internal   = false
  config.aliyun_area       = ENV["ALIYUN_OSS_AREA"]
  # config.aliyun_host       = Setting.upload_url

end