require 'singleton'

# \Deprecation specifies the API used by Rails to deprecate methods, instance
# variables, objects and constants.
class ZomgDeprecation
  require 'deprecation/instance_delegator'
  require 'deprecation/behaviors'
  require 'deprecation/reporting'
  require 'deprecation/method_wrappers'
  require 'deprecation/proxy_wrappers'
  require 'deprecation/core_ext/module/deprecation'

  include Singleton
  include InstanceDelegator
  include Behavior
  include Reporting
  include MethodWrapper

  # The version number in which the deprecated behavior will be removed, by default.
  attr_accessor :deprecation_horizon

  # It accepts two parameters on initialization. The first is a version of library
  # and the second is a library name
  #
  #   ActiveSupport::Deprecation.new('2.0', 'MyLibrary')
  def initialize(deprecation_horizon = '5.0', gem_name = 'Rails')
    self.gem_name = gem_name
    self.deprecation_horizon = deprecation_horizon
    # By default, warnings are not silenced and debugging is off.
    self.silenced = false
    self.debug = false
  end
end
