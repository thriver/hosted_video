module HostedVideo
  module Providers
    class VimeoByIframe < Vimeo
      def self.can_parse?(url)
        url =~ /player\.vimeo\.com\/video\/\d{5,}.*/
      end

      def kind
        'vimeo'
      end

      private

      def vid_regex
        /player\.vimeo\.com\/video\/(?<id>\d{5,}).*/
      end
    end
  end
end