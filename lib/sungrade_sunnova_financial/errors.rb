module SungradeSunnovaFinancial
  class Err < StandardError; end
  class RequiredSettingMissing < Err; end
  class NoAccessTokenSet < Err; end
  class UnsuccessfulRequest < Err
    attr_reader :response

    def initialize(response:)
      @response = response
      super([response.status, response.body].join(":"))
    end
  end
end
