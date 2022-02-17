module HostedVideo
  module Providers
    class Vimeo < Base
      def self.can_parse?(url)
        url =~ /vimeo\.com\/\d{5,}.*/
      end

      def preview
        JSON.load(open("https://vimeo.com/api/v2/video/#{vid}.json")).first['thumbnail_large']
      end

      def url_for_iframe
        "https://player.vimeo.com/video/#{vid}?api=0"
      end

      private

      def vid_regex
        /(https?:\/\/)?(www\.)?vimeo\.com\/(?<id>\d{5,}).*/
      end
    end
  end
end
