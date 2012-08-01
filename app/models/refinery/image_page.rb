module Refinery
  class ImagePage < Refinery::Core::BaseModel
    belongs_to :image
    belongs_to :page, :polymorphic => true
    serialize :oembed_data

    before_save :reset_oembed, :if => :oembed_url_changed?

    translates :caption if self.respond_to?(:translates)

    attr_accessible :image_id, :position, :locale
    self.translation_class.send :attr_accessible, :locale

    def oembed_provider
      oembed_url.blank? ? nil : OEmbed::Providers.find(oembed_url)
    end

    def oembed(options = nil)
      if oembed_data[options].blank?
        oembed_data[options] = OEmbed::Providers.get(oembed_url, options.dup).fields
        save
      end
      oembed_data[options].try(:[], 'html')
    rescue OEmbed::Error => e
      nil
    end

    private

    def reset_oembed
      self.oembed_data = {}
    end
  end
end
