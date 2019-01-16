module SungradeSunnovaFinancial
  class LeadPerson
    class << self
      def authorize_credit_check(settings:, id:)
        requester = Request.new(settings: settings)
        config = settings.configuration
        requester.patch do |req|
          req.headers.merge!("Content-Type" => "application/json")
          req.url("#{settings.api_version}/#{config.stage}/partner/leadpersons/#{id}/emailcreditauth")
          req.body = {}.to_json
        end
      end

      def credit_check_status(settings:, id:)
        requester = Request.new(settings: settings)
        config = settings.configuration
        requester.get do |req|
          req.url("#{settings.api_version}/#{config.stage}/partner/leadpersons/#{id}/creditstatus")
        end
      end
    end
  end
end
