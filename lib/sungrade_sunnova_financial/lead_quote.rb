module SungradeSunnovaFinancial
  class LeadQuote
    class << self
      def create(settings:, lead_system_id:, body:)
        requester = Request.new(settings: settings)
        config = settings.configuration
        unless body.is_a?(String)
          body = body.to_json
        end
        requester.post do |req|
          req.headers.merge!("Content-Type" => "application/json")
          req.url("#{settings.api_version}/#{config.stage}/partner/leadsystems/#{lead_system_id}/leadquotes")
          req.body = body
        end
      end

      def fetch(settings:, lead_quote_id:)
        requester = Request.new(settings: settings)
        config = settings.configuration
        requester.get do |req|
          req.url("#{settings.api_version}/#{config.stage}/partner/leadquotes/#{lead_quote_id}")
        end
      end
    end
  end
end
