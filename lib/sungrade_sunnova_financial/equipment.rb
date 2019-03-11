module SungradeSunnovaFinancial
  class Equipment
    class << self
      def list_all(settings:)
        requester = Request.new(settings: settings)
        requester.get do |req|
          req.url("#{settings.api_version}/#{settings.stage}/partner/equipment")
        end
      end
    end
  end
end
