module SungradeSunnovaFinancial
  class Lead
    class << self
      def create(settings:, body:)
        requester = Request.new(settings: settings)
        config = settings.configuration
        requester.post do |req|
          req.headers.merge!("Content-Type" => "application/json")
          req.url("#{settings.api_version}/#{config.stage}/partner/leads")
          req.body = body.to_json
        end
      end

      def update(settings:, id:, body:)
        requester = Request.new(settings: settings)
        config = settings.configuration
        requester.patch do |req|
          req.headers.merge!("Content-Type" => "application/json")
          req.url("#{settings.api_version}/#{config.stage}/partner/leads/#{id}")
          req.body = body.to_json
        end
      end

      def lead_persons(settings:, id:)
        requester = Request.new(settings: settings)
        config = settings.configuration
        requester.get do |req|
          req.url("#{settings.api_version}/#{config.stage}/partner/leads/#{id}/leadpersons")
        end
      end

      def run_title_check(settings:, id:)
        requester = Request.new(settings: settings)
        config = settings.configuration
        requester.patch do |req|
          req.url("#{settings.api_version}/#{config.stage}/partner/leads/#{id}/title")
        end
      end

      def fetch(settings:, id:)
        requester = Request.new(settings: settings)
        config = settings.configuration
        requester.get do |req|
          req.url("#{settings.api_version}/#{config.stage}/partner/leads/#{id}")
        end
      end
    end
  end
end
