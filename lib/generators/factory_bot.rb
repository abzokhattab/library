require 'rails/generators/named_base'

module FactoryBot
  module Generators
    class Base < Rails::Generators::NamedBase #:nodoc:
      # def self.source_root
      #   @_factory_bot_source_root ||= File.expand_path(File.join(File.dirname(__FILE__), 'factory_bot', generator_name, 'templates'))
      # end

      def explicit_class_option
        model_name = class_name.split(/v([0-9]::+)/i).last
        ", class: '#{model_name}'" unless model_name == singular_table_name.camelize
      end
    end
  end
end
