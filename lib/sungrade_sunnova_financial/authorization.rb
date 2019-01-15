module SungradeSunnovaFinancial
  class Authorization
    class << self
      def fetch_code(settings: SungradeSunnovaFinancial.new_settings, response_type: :code, **opts)
        params = {
          response_type: response_type,
          client_id: settings.client_id,
          redirect_uri: settings.redirect_uri
        }.merge(opts)
        requester = Request.new(
          settings: settings,
          requires_access_token: false,
          base_url_meth: :base_token_url
        )
        response = requester.post do |req|
          req.url("/services/oauth2/authorize")
          req.params.merge!(params)
        end
        response
      end

      def fetch_token(settings: SungradeSunnovaFinancial.new_settings, grant_type: :authorization_code, **opts)
        params = {
          grant_type: grant_type,
          client_id: settings.client_id,
          client_secret: settings.client_secret,
        }.merge(opts)
        unless grant_type.to_s == "password"
          params = params.merge(redirect_uri: settings.redirect_uri)
        end
        requester = Request.new(
          settings: settings,
          requires_access_token: false,
          base_url_meth: :base_token_url
        )
        response = requester.post do |req|
          req.url("/services/oauth2/token")
          req.params.merge!(params)
        end
        response
      end

      def refresh_token(settings: SungradeSunnovaFinancial.new_settings, refresh_token:, **opts)
        params = {
          refresh_token: refresh_token,
          grant_type: :refresh_token,
          client_id: settings.client_id,
          client_secret: settings.client_secret
        }.merge(opts)
        requester = Request.new(
          settings: settings,
          requires_access_token: false,
          base_url_meth: :base_token_url
        )
        response = requester.post do |req|
          req.url("/services/oauth2/token")
          req.params.merge!(params)
        end
        response
      end
    end
  end
end
