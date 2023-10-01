# frozen_string_literal: true

require "fast_jsonapi"
require "alchemy_cms"
require "alchemy/json_api/engine"
require "alchemy/json_api/page_class_methods_extension"

require File.expand_path('../../app/models/alchemy/page', Alchemy::Engine.called_from)

module Alchemy
  class Page < BaseRecord
    class << self
      def ransackable_attributes(_auth_object = nil)
        super | %w[page_layout]
      end

      def ransackable_associations(_auth_object = nil)
        super | %w[public_version]
      end
    end
  end
end

module Alchemy
  module JsonApi
    # Set FastJsonapi key_transform
    #
    # Supported transformations:
    #
    # :camel # "some_key" => "SomeKey"
    # :camel_lower # "some_key" => "someKey"
    # :dash # "some_key" => "some-key"
    # :underscore # "some_key" => "some_key"
    def self.key_transform=(value)
      @_key_transform = value
    end

    # FastJsonapi key_transform
    #
    # Default :underscore # "some_key" => "some_key"
    def self.key_transform
      @_key_transform || :underscore
    end
  end
end
