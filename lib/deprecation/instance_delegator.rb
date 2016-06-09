# TODO: this was changed

require 'active_support/core_ext/kernel/singleton_class'
require 'active_support/core_ext/module/delegation'

module InstanceDelegator # :nodoc:
  def self.included(base)
    base.extend(ClassMethods)
    base.public_class_method :new
  end

  module ClassMethods # :nodoc:
    def include(included_module)
      included_module.instance_methods.each { |m| method_added(m) }
      super
    end

    def method_added(method_name)
      #singleton_class.module_eval do
      #  [
      #    "def #{method_name}",
      #    " _ = self.instance",
      #    "rescue NoMethodError => e",
      #    "  if _.nil? && e.name == :#{method_name}",
      #    "    zomgwtf",
      #    "  else",
      #    "    raise",
      #    "  end",
      #    "end"
      #  ].join ';'
      #end
      singleton_class.delegate(method_name, to: :instance)
    end
  end
end
