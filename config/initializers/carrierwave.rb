if Rails.env.development? || Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: "AWS",
      aws_access_key_id: "AKIAITCANL3N65QWCMAQ",
      aws_secret_access_key: "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"
    }
    config.fog_directory = ENV["S3_BUCKET"]="yologo"
  end
end
