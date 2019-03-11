module SungradeSunnovaFinancial
  class LeadQuote
    class << self
      def create(settings:, lead_system_id:, body:)
        requester = Request.new(settings: settings)
        unless body.is_a?(String)
          body = body.to_json
        end
        requester.post do |req|
          req.headers.merge!("Content-Type" => "application/json")
          req.url("#{settings.api_version}/#{settings.stage}/partner/leadsystems/#{lead_system_id}/leadquotes")
          req.body = body
        end
      end

      def fetch(settings:, lead_quote_id:)
        requester = Request.new(settings: settings)
        requester.get do |req|
          req.url("#{settings.api_version}/#{settings.stage}/partner/leadquotes/#{lead_quote_id}")
        end
      end

      def email_contract(settings:, lead_quote_id:)
        requester = Request.new(settings: settings)
        requester.patch do |req|
          req.headers.merge!("Content-Type" => "application/json")
          req.url("#{settings.api_version}/#{settings.stage}/partner/leadquotes/#{lead_quote_id}/emailcontract")
        end
      end

      def email_proposal(settings:, lead_quote_id:, partner_only: false)
        requester = Request.new(settings: settings)
        base_url = "#{settings.api_version}/#{settings.stage}/partner/leadquotes/#{lead_quote_id}"
        additional = partner_only ? "emailproposaltopartner" : "emailproposal"
        url = [base_url, additional].join("/")
        requester.patch do |req|
          req.headers.merge!("Content-Type" => "application/json")
          req.url(url)
        end
      end
    end
  end
end
