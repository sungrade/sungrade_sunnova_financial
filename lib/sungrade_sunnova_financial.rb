require "sungrade_sunnova_financial/version"
require "sungrade_sunnova_financial/errors"
require "sungrade_sunnova_financial/configuration"
require "sungrade_sunnova_financial/request"
require "sungrade_sunnova_financial/settings"
require "sungrade_sunnova_financial/authorization"
require "sungrade_sunnova_financial/lead"
require "sungrade_sunnova_financial/lead_person"
require "sungrade_sunnova_financial/lead_system"
require "sungrade_sunnova_financial/lead_quote"
require "sungrade_sunnova_financial/equipment"
require "sungrade_sunnova_financial/utility"

module SungradeSunnovaFinancial
  class << self
    def new_settings
      SungradeSunnovaFinancial::Settings.new
    end

    def configure
      yield(Configuration.instance)
    end
  end
end
