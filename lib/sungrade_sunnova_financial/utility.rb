module SungradeSunnovaFinancial
  class Utility
    class << self
      def property_utilities(settings:, lead_id:)
        requester = Request.new(settings: settings)
        config = settings.configuration
        requester.get do |req|
          req.url("#{settings.api_version}/#{config.stage}/partner/utilities")
        end
      end

      # /partner/leads/{LID}/utilities/{LSEID}
      def update_utility_information(settings:, lead_id:, lse_id:, body:)
        requester = Request.new(settings: settings)
        config = settings.configuration
        unless body.is_a?(String)
          body = body.to_json
        end
        requester.patch do |req|
          req.headers.merge!("Content-Type" => "application/json")
          req.url("#{settings.api_version}/#{config.stage}/partner/leads/#{lead_id}/utilities/#{lse_id}")
          req.body = body
        end
      end

      def rate_plans(settings:, lead_id:, lse_id:)
        requester = Request.new(settings: settings)
        config = settings.configuration
        requester.get do |req|
          req.url("#{settings.api_version}/#{config.stage}/partner/leads/#{lead_id}/utilities/#{lse_id}/rateplans")
        end
      end

      def current_rate_plans(settings:, lead_id:, lse_id:)
        requester = Request.new(settings: settings)
        config = settings.configuration
        requester.get do |req|
          req.url("#{settings.api_version}/#{config.stage}/partner/leads/#{lead_id}/utilities/#{lse_id}/currentrateplans")
        end
      end

      def proposed_rate_plans(settings:, lead_id:, lse_id:)
        requester = Request.new(settings: settings)
        config = settings.configuration
        requester.get do |req|
          req.url("#{settings.api_version}/#{config.stage}/partner/leads/#{lead_id}/utilities/#{lse_id}/proposedrateplans")
        end
      end

      def escalations(settings:, lse_id:)
        requester = Request.new(settings: settings)
        config = settings.configuration
        requester.get do |req|
          req.url("#{settings.api_version}/#{config.stage}/partner/utilities/#{lse_id}/escalations")
        end
      end
    end
  end
end
