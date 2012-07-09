module Refinery
  module PageImages
    include ActiveSupport::Configurable

    config_accessor :captions
    config_accessor :oembed

    self.captions = false
    self.oembed = false
  end
end
