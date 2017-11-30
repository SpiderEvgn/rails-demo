# require 'carrierwave'
# require 'carrierwave/validations/active_model'

CarrierWave.configure do |config|

  config.storage = :aliyun
  config.aliyun_access_id  = 'LTAIye2kBpiPyLwY'
  config.aliyun_access_key = 'dg4dJduLQXtcAC3YjjNGAySwT8rKut'
  config.aliyun_bucket     = 'maximum-aaron'
  # config.aliyun_internal   = Setting.upload_aliyun_internal.to_s == 'false' ? false : true
  config.aliyun_internal   = false
  config.aliyun_area       = 'cn-shanghai'
  # config.aliyun_host       = Setting.upload_url

end


