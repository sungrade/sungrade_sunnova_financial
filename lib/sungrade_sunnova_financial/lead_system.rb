module SungradeSunnovaFinancial
  class LeadSystem
    class << self
      def create(settings:, lead_id:, body:)
        requester = Request.new(settings: settings)
        config = settings.configuration
        unless body.is_a?(String)
          body = body.to_json
        end
        requester.post do |req|
          req.headers.merge!("Content-Type" => "application/json")
          req.url("#{settings.api_version}/#{config.stage}/partner/leads/#{lead_id}/leadsystems")
          req.body = body
        end
      end

      def build_lead_systems(settings:, lead_id:, body:)
        requester = Request.new(settings: settings)
        config = settings.configuration
        unless body.is_a?(String)
          body = body.to_json
        end
        requester.post do |req|
          req.headers.merge!("Content-Type" => "application/json")
          req.url("#{settings.api_version}/#{config.stage}/partner/leads/#{lead_id}/buildleadsystems")
          req.body = body
        end
      end
    end
  end
end
